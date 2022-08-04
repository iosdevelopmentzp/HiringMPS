//
//  PeopleViewModel.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation
import MVVM
import UseCases
import RxCocoa
import RxSwift

public final class PeopleViewModel: ViewModel {
    // MARK: - Nested
    
    public struct Input {
        let viewWillAppearEvent: ControlEvent<Void>
        let retryTapEvent: ControlEvent<Void>
        let disposeBag: DisposeBag
    }
    
    public struct Output {
        let stateObservable: Driver<PeopleState>
    }
    
    // MARK: - Properties
    
    public weak var sceneDelegate: PeopleSceneDelegate?
    
    private let useCase: CompanyUseCaseProtocol
    
    private let stateSubject = BehaviorSubject(value: PeopleState.idle)
    
    private let lock = NSLock()
    
    // MARK: - Constructor
    
    public init(_ useCase: CompanyUseCaseProtocol) {
        self.useCase = useCase
    }
    
    // MARK: - Transform
    
    public func transform(_ input: Input, outputHandler: @escaping (Output) -> Void) {
        let loadSignal = Observable.merge([
            input.retryTapEvent.asObservable(),
            input.viewWillAppearEvent.take(1)
        ])
        
        input.disposeBag.insert([
            setupLoadObserving(with: loadSignal)
        ])
        
        outputHandler(
            .init(stateObservable: stateSubject.asDriver(onErrorJustReturn: .idle))
        )
    }
}

// MARK: - Setup

private extension PeopleViewModel {
    private func setupLoadObserving(with signal: Observable<Void>) -> Disposable {
        signal
            .flatMapLatest { _ in
                self.loadData()
            }
            .bind(to: stateSubject)
    }
}

// MARK: - Private Function

private extension PeopleViewModel {
    private func loadData() -> Observable<PeopleState> {
        updateState(.loading)
        
        return useCase
            .setupPeople()
            .asObservable()
            .map { people -> PeopleState in
                return .loaded(models: people.sorted().map(PeopleCellModel.Factory.make(from:)))
            }
            .catch { .just(.error($0.localizedDescription)) }
    }
    
    /// Thread safe way to update state
    ///
    private func updateState(_ state: PeopleState) {
        lock.lock()
        defer { lock.unlock() }
        stateSubject.onNext(state)
    }
}
