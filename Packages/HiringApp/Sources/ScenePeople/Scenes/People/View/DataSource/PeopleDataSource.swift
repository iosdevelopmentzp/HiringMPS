//
//  PeopleDataSource.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import RxDataSources
import UIKit

class PeopleDataSource: RxCollectionViewSectionedReloadDataSource<PeopleSection> {
    typealias ConfigureCell = (UICollectionView, IndexPath, Item) -> UICollectionViewCell
    
    init(configureCell: @escaping ConfigureCell) {
        super.init(
            configureCell: { _, collectionView, indexPath, item in configureCell(collectionView, indexPath, item) },
            configureSupplementaryView: nil
        )
    }
}
