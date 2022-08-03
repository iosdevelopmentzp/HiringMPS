//
//  PeopleViewModel.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation
import MVVM
import UseCases

public final class PeopleViewModel: ViewModel {
    // MARK: - Nested
    
    public struct Input {
        
    }
    
    public struct Output {
        
    }
    
    // MARK: - Properties
    
    public weak var sceneDelegate: PeopleSceneDelegate?
    
    private let useCase: CompanyUseCaseProtocol
    
    // MARK: - Constructor
    
    public init(_ useCase: CompanyUseCaseProtocol) {
        self.useCase = useCase
    }
    
    // MARK: - Transform
    
    public func transform(_ input: Input, outputHandler: @escaping (Output) -> Void) {
        
    }
}
