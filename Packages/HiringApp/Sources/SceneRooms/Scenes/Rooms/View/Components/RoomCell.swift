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
    // MARK: - Nested
    
    private struct Design {
        static let occupiedColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        static let occupiedBorderColor = UIColor.clear
        static let occupiedTextColor = UIColor.white
        static let occupiedSeparatorColor = UIColor.white
        static let occupiedInfoColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        static let freeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        static let freeBorderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        static let freeTextColor = UIColor.black
        static let freeSeparatorColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        static let freeInfoColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
    }
    
    // MARK: - Properties
    
    private let roundedContainer = UIView()
    private let titleLabel = UILabel()
    private let separator = UIView()
    private let bottomInfoLabel = UILabel()
    
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
        roundedContainer.layer.cornerRadius = 10
        roundedContainer.layer.borderWidth = 1
        
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        
        bottomInfoLabel.textColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        bottomInfoLabel.font = .systemFont(ofSize: 15)
        bottomInfoLabel.numberOfLines = 2
        bottomInfoLabel.textAlignment = .left
    }
    
    func addViews() {
        container.addSubview(roundedContainer)
        roundedContainer.addSubview(titleLabel)
        roundedContainer.addSubview(separator)
        roundedContainer.addSubview(bottomInfoLabel)
    }
    
    func layoutViews() {
        titleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(6)
            $0.right.equalToSuperview().inset(6)
        }
        
        separator.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(self.titleLabel.snp.bottom)
        }
        
        bottomInfoLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(6)
            $0.bottom.equalToSuperview().inset(6)
        }
        
        roundedContainer.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
            $0.height.equalTo(self.roundedContainer.snp.width)
        }
    }
}

// MARK: - Configure

extension RoomCell {
    func configure(using model: RoomCellModel) {
        bottomInfoLabel.text = model.bottomText
        titleLabel.text = "Room: #\(model.id)"
        
        bottomInfoLabel.textColor = model.isOccupied ? Design.occupiedInfoColor : Design.freeInfoColor
        separator.backgroundColor = model.isOccupied ? Design.occupiedSeparatorColor : Design.freeSeparatorColor
        titleLabel.textColor = model.isOccupied ? Design.occupiedTextColor : Design.freeTextColor
        roundedContainer.backgroundColor = model.isOccupied ? Design.occupiedColor : Design.freeColor
        roundedContainer.layer.borderColor = (model.isOccupied ? Design.occupiedBorderColor : Design.freeBorderColor).cgColor
    }
}
