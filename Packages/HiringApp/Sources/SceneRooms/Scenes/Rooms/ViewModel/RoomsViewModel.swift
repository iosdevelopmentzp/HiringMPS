//
//  RoomsViewModel.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation
import MVVM
import UseCases
import RxCocoa
import RxSwift

public struct RoomsViewModel: ViewModel {
    // MARK: - Nested
    
    public struct Input {
        let viewWillAppearEvent: ControlEvent<Void>
        let reloadTapEvent: ControlEvent<Void>
        let disposeBag: DisposeBag
    }
    
    public struct Output {
        let stateObservable: Driver<RoomsState>
    }
    
    // MARK: - Properties
    
    private let companyUseCase: CompanyUseCaseProtocol
    
    private let stateSubject = BehaviorSubject(value: RoomsState.idle)
    
    private let lock = NSLock()
    
    // MARK: - Constructor
    
    public init(_ companyUseCase: CompanyUseCaseProtocol) {
        self.companyUseCase = companyUseCase
    }
    
    // MARK: - Bind
    
    public func transform(_ input: Input, outputHandler: @escaping (Output) -> Void) {
        let loadSignal = Observable.merge([
            input.reloadTapEvent.asObservable(),
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

private extension RoomsViewModel {
    private func setupLoadObserving(with signal: Observable<Void>) -> Disposable {
        signal
            .flatMapLatest { _ in
                loadData()
            }
            .bind(to: stateSubject)
    }
}

// MARK: - Private Function

private extension RoomsViewModel {
    private func loadData() -> Observable<RoomsState> {
        updateState(.loading)
        
        return companyUseCase
            .setupRooms()
            .asObservable()
            .map { rooms -> RoomsState in
                return .loaded(models: rooms.map(RoomCellModel.Factory.make(from:)))
            }
            .catch { .just(.error($0.localizedDescription)) }
    }
    
    /// Thread safe way to update state
    ///
    private func updateState(_ state: RoomsState) {
        lock.lock()
        defer { lock.unlock() }
        stateSubject.onNext(state)
    }
}
