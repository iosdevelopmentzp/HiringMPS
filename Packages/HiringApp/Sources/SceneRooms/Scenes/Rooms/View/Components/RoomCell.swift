//
//  RoomCell.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import UIKit
import Extensions
import SharedViews

final class RoomCell: DynamicCollectionCell, Reusable, ViewSettableType {
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
        container.backgroundColor = .blue
        container.layer.cornerRadius = 10
        
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20)
    }
    
    func addViews() {
        contentView.addSubview(container)
        container.addSubview(titleLabel)
    }
    
    func layoutViews() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        container.snp.makeConstraints {
            $0.height.equalTo(70)
        }
    }
}

// MARK: - Configure

extension RoomCell {
    func configure(using model: RoomCellModel) {
        titleLabel.text = model.title
    }
}
