//
//  DynamicCollectionCell.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import UIKit

/// Cell that can be used as base class for custom cells that are using for height dynamic collection view
/// During layout of cell subviews, content view  should be pinned to the bottom of content
///
open class DynamicCollectionCell: UICollectionViewCell {
    private lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    open override func systemLayoutSizeFitting(
        _ targetSize: CGSize,
        withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
        verticalFittingPriority: UILayoutPriority
    ) -> CGSize {
        width.constant = bounds.size.width
        let size = contentView.systemLayoutSizeFitting(
            .init(width: targetSize.width, height: UIView.layoutFittingCompressedSize.height),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        return size
    }
}
