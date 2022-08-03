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
        
    }
    
    public struct Output {
        let stateObservable: Driver<RoomsState>
    }
    
    // MARK: - Properties
    
    private let companyUseCase: CompanyUseCaseProtocol
    
    private let stateSubject = BehaviorSubject(value: RoomsState.idle)
    
    // MARK: - Constructor
    
    public init(_ companyUseCase: CompanyUseCaseProtocol) {
        self.companyUseCase = companyUseCase
    }
    
    // MARK: - Bind
    
    public func bind(input: Input) -> Output {
        return .init(
            stateObservable: stateSubject.asDriver(onErrorJustReturn: .idle)
        )
    }
}
