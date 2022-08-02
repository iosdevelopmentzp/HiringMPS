//
//  RoomsViewController.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import UIKit
import MVVM
import Extensions
import SnapKit

public class RoomsViewController: UIViewController, View, ViewSettableType {
    // MARK: - Properties
    
    public let viewModel: RoomsViewModel
    
    private let tableView = UITableView()
    
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
        performSetupViews()
    }
    
    // MARK: - Setup
    
    public func setupViews() {
        tableView.backgroundColor = .red
    }
    
    public func addViews() {
        view.addSubview(tableView)
    }
    
    public func layoutViews() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaInsets)
        }
    }
    
    public func setupOutput() {
        let input = viewModel.bind(input: .init())
        setupInput(input)
    }
    
    public func setupInput(_ input: RoomsViewModel.Output) {
        
    }
}
