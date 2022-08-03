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
import RxDataSources
import SharedViews

public class RoomsViewController: UIViewController, View, ViewSettableType {
    // MARK: - Properties
    
    public let viewModel: RoomsViewModel
    
    private let viewLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
    
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
        collectionView.backgroundColor = .red
        collectionView.registerCellClass(RoomCell.self)
        collectionView.registerCellClass(LoadingCell.self)
        collectionView.registerCellClass(ErrorCell.self)
    }
    
    public func addViews() {
        view.addSubview(collectionView)
    }
    
    public func layoutViews() {
        collectionView.snp.makeConstraints {
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

// MARK: - Private Functions

private extension RoomsViewController {
    private func dataSource() -> RoomsDataSource {
        .init { collectionView, indexPath, item in
            switch item {
            case .loading:
                return collectionView.dequeueReusableCell(ofType: LoadingCell.self, at: indexPath)
                
            case .error(let message):
                let cell = collectionView.dequeueReusableCell(ofType: ErrorCell.self, at: indexPath)
                cell.configure(using: message)
                return cell
                
            case .model(let model):
                let cell = collectionView.dequeueReusableCell(ofType: RoomCell.self, at: indexPath)
                cell.configure(using: model)
                return cell
            }
        }
    }
}
