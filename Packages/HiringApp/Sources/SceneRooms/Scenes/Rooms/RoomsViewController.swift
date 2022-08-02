//
//  RoomsViewController.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import UIKit
import MVVM

public class RoomsViewController: UIViewController {
    // MARK: - Properties
    
    public let viewModel: RoomsViewModel
    
    // MARK: - Constructor
    
    public init(_ viewModel: RoomsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupOutput()
        self.view.backgroundColor = UIColor.red
    }
}

// MARK: - View

extension RoomsViewController: View {
    public func setupOutput() {
        let input = viewModel.bind(input: .init())
        setupInput(input)
    }
    
    public func setupInput(_ input: RoomsViewModel.Output) {
        
    }
}
