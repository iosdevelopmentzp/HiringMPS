//
//  UICollectionView+Reuse.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation
import UIKit

public extension UICollectionView {
    func registerCellClass<T: Reusable>(_ cellType: T.Type) where T: UICollectionViewCell {
        register(cellType, forCellWithReuseIdentifier: cellType.identifier)
    }
    
    func dequeueReusableCell<T: Reusable>(
        ofType cellType: T.Type,
        at indexPath: IndexPath
    ) -> T where T: UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? T else {
            fatalError("Failed attempt dequeue cell with identifier \(cellType.identifier)")
        }
        return cell
    }

}
