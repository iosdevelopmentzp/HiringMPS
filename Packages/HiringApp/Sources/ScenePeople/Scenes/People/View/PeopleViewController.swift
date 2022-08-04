//
//  PeopleViewController.swift
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
import RxExtensions

public final class PeopleViewController: UIViewController, View, ViewSettableType {
    // MARK: - Nested
    
    private enum LayoutMode: Equatable {
        case singleColumn
        case dualColumn
    }
    
    // MARK: - Properties
    
    public let viewModel: PeopleViewModel
    
    private let disposeBag = DisposeBag()
    
    private let viewLayout = UICollectionViewFlowLayout()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
    
    private let retrySubject = PublishSubject<Void>()
    
    private var currentSectionType: PeopleSection.SectionType = .single
    private var layoutMode: LayoutMode = .singleColumn
    
    // MARK: - Constructor
    
    public init(_ viewModel: PeopleViewModel) {
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
        recalculateLayout(contentWidth: collectionView.contentSize.width)
        
    }
    
    // MARK: - Setup
    
    public func setupViews() {
        collectionView.registerCellClass(PeopleCell.self)
        collectionView.registerCellClass(LoadingCell.self)
        collectionView.registerCellClass(ErrorCell.self)
        
        viewLayout.scrollDirection = .vertical
    }
    
    public func setupLocalization() {
        navigationItem.title = "Company Staff"
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
        let input = PeopleViewModel.Input(
            viewWillAppearEvent: rx.viewWillAppear,
            retryTapEvent: ControlEvent(events: retrySubject),
            disposeBag: disposeBag
        )
        
        viewModel.transform(input) {
            self.setupInput($0)
        }
    }
    
    public func setupInput(_ input: PeopleViewModel.Output) {
        disposeBag.insert([
            setupDataSourceObserving(with: input.stateObservable)
        ])
    }
}

// MARK: - Private Functions

private extension PeopleViewController {
    private func setupDataSourceObserving(with input: Driver<PeopleState>) -> Disposable {
        input
            .map(PeopleSection.Factory.make(_:))
            .do(onNext: { [weak self] in
                // Update collection layout depends on section type
                $0.first.map {
                    guard let self = self else { return }
                    self.currentSectionType = $0.type
                    self.recalculateLayout(contentWidth: self.collectionView.contentSize.width)
                }
            })
            .drive(collectionView.rx.items(dataSource: dataSource()))
    }
    
    private func recalculateLayout(contentWidth: CGFloat) {
        updateLayoutMode(for: currentSectionType)
        
        let itemWidth: CGFloat
        let itemSpace: CGFloat
        let lineSpace: CGFloat = 10
        
        switch layoutMode {
        case .singleColumn:
            itemWidth = contentWidth
            itemSpace = 0
            
        case .dualColumn:
            itemSpace = 0
            itemWidth = (contentWidth / 2) - itemSpace
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
    
    private func updateLayoutMode(for sectionType: PeopleSection.SectionType) {
        let contentWidth = collectionView.contentSize.width
        
        switch sectionType {
        case .single:
            layoutMode = .singleColumn
            
        case .main where contentWidth > 500:
            layoutMode = .dualColumn
            
        case .main:
            layoutMode = .singleColumn
        }
    }
}

// MARK: - Data Source

private extension PeopleViewController {
    private func dataSource() -> PeopleDataSource {
        .init { [weak self] collectionView, indexPath, item in
            switch item {
            case .loading:
                return collectionView.dequeueReusableCell(ofType: LoadingCell.self, at: indexPath)
                
            case .error(let message):
                let cell = collectionView.dequeueReusableCell(ofType: ErrorCell.self, at: indexPath)
                cell.configure(using: message)
                cell.delegate = self
                return cell
                
            case .model(let model):
                let cell = collectionView.dequeueReusableCell(ofType: PeopleCell.self, at: indexPath)
                cell.configure(using: model)
                return cell
            }
        }
    }
}

// MARK: - ErrorCellEventsDelegate

extension PeopleViewController: ErrorCellEventsDelegate {
    public func cell(_ cell: ErrorCell, didPressRetryButton sender: UIButton) {
        retrySubject.onNext(())
    }
}
