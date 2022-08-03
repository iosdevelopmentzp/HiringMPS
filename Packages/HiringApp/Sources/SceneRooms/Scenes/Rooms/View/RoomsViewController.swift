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
import RxSwift
import RxCocoa
import RxDataSources
import SharedViews

public class RoomsViewController: UIViewController, View, ViewSettableType {
    // MARK: - Nested
    
    private enum LayoutMode: Equatable {
        case singleColumn
        case dualColumn
    }
    
    // MARK: - Properties
    
    public let viewModel: RoomsViewModel
    
    private let disposeBag = DisposeBag()
    
    private let viewLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
    
    private var layoutMode: LayoutMode = .singleColumn {
        didSet {
            guard layoutMode != oldValue else { return }
            recalculateLayout()
        }
    }
    
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
        performSetupViews()
        setupOutput()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        recalculateLayout()
    }
    
    // MARK: - Setup
    
    public func setupViews() {
        collectionView.registerCellClass(RoomCell.self)
        collectionView.registerCellClass(LoadingCell.self)
        collectionView.registerCellClass(ErrorCell.self)
        
        viewLayout.scrollDirection = .vertical
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
        let event = ControlEvent(events: Observable.just(()))
        
        let input = RoomsViewModel.Input(
            reloadTapEvent: event,
            disposeBag: disposeBag
        )
        
        viewModel.transform(input) {
            self.setupInput($0)
        }
    }
    
    public func setupInput(_ input: RoomsViewModel.Output) {
        disposeBag.insert([
            setupDataSourceObserving(with: input.stateObservable)
        ])
    }
}

// MARK: - Private Functions

private extension RoomsViewController {
    private func setupDataSourceObserving(with input: Driver<RoomsState>) -> Disposable {
        input
            .map(RoomsSection.Factory.make(_:))
            .drive(collectionView.rx.items(dataSource: dataSource()))
    }
    
    private func recalculateLayout() {
        let itemWidth: CGFloat
        let itemSpace: CGFloat
        let lineSpace: CGFloat = 10
        
        switch layoutMode {
        case .singleColumn:
            itemWidth = collectionView.bounds.width
            itemSpace = 0
            
        case .dualColumn:
            itemSpace = 10
            itemWidth = (collectionView.bounds.width / 2) - itemSpace
        }
        
        let newItemSize = CGSize(width: itemWidth, height: 10)
        
        guard viewLayout.itemSize != newItemSize ||
                viewLayout.minimumInteritemSpacing != itemSpace ||
                viewLayout.minimumLineSpacing != lineSpace else {
            return
        }
        viewLayout.estimatedItemSize = newItemSize
        viewLayout.minimumLineSpacing = lineSpace
        viewLayout.minimumInteritemSpacing = itemSpace
        viewLayout.invalidateLayout()
    }
}

// MARK: - Data Source

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
