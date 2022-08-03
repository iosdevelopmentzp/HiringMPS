//
//  PeopleViewController.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation
import MVVM
import UIKit

public final class PeopleViewController: UIViewController, View {
    // MARK: - Properties
    
    public let viewModel: PeopleViewModel
    
    // MARK: - Constructor
    
    public init(_ viewModel: PeopleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    public func setupOutput() {
        viewModel.transform(.init()) {
            self.setupInput($0)
        }
    }
    
    public func setupInput(_ input: PeopleViewModel.Output) {
        
    }
}
