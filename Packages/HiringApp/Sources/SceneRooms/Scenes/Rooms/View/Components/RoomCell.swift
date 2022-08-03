//
//  RoomCell.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import UIKit
import Extensions

final class RoomCell: UICollectionViewCell, Reusable, ViewSettableType {
    // MARK: - Properties
    
    private let titleLabel = UILabel()
    
    // MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        performSetupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupViews() {
        contentView.backgroundColor = UIColor.green
        contentView.layer.cornerRadius = 10
        
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20)
    }
    
    func addViews() {
        contentView.addSubview(titleLabel)
    }
    
    func layoutViews() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.right.equalToSuperview().inset(30)
        }
    }
}

// MARK: - Configure

extension RoomCell {
    func configure(using model: RoomCellModel) {
        titleLabel.text = model.title
    }
}
