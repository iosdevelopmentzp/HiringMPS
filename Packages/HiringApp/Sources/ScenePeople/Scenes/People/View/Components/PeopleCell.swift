//
//  PeopleCell.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import UIKit
import SharedViews
import Extensions
import SDWebImage

final class PeopleCell: DynamicCollectionCell, Reusable, ViewSettableType {
    // MARK: - Properties
    
    private let roundedContainer = UIView()
    private let avatarImageView = UIImageView()
    private let fullNameLabel = UILabel()
    private let jobTitleLabel = UILabel()
    private let emailLabel = UILabel()
    
    // MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        performSetupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.sd_cancelCurrentImageLoad()
        avatarImageView.image = nil
    }
    
    // MARK: - Setup
    
    func setupViews() {
        container.backgroundColor = .white
        container.layer.cornerRadius = 10
        
        roundedContainer.backgroundColor = #colorLiteral(red: 0.768627451, green: 0.7960784314, blue: 0.7647058824, alpha: 1)
        roundedContainer.layer.cornerRadius = 10
        
        fullNameLabel.textColor = .black
        fullNameLabel.font = .systemFont(ofSize: 20)
        
        jobTitleLabel.textColor = .black
        jobTitleLabel.font = .systemFont(ofSize: 17)
        
        emailLabel.textColor = .darkGray
        emailLabel.font = .systemFont(ofSize: 14, weight: .thin)
        
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = 35
    }
    
    func addViews() {
        container.addSubview(roundedContainer)
        roundedContainer.addSubview(avatarImageView)
        roundedContainer.addSubview(fullNameLabel)
        roundedContainer.addSubview(jobTitleLabel)
        roundedContainer.addSubview(emailLabel)
    }
    
    func layoutViews() {
        roundedContainer.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        avatarImageView.snp.makeConstraints {
            $0.size.equalTo(70)
            $0.left.top.equalToSuperview().offset(10)
        }
        
        fullNameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(40)
        }
    }
}

// MARK: - Configure

extension PeopleCell {
    func configure(using model: PeopleCellModel) {
        fullNameLabel.text = model.fullName
        
        model.avatarLink.flatMap { URL(string: $0) }.map {
            avatarImageView.sd_setImage(with: $0)
        }
    }
}

