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
    // MARK: - Nested
    
    typealias Separatos = (top: UIView, middle: UIView, bottom: UIView)
    
    // MARK: - Properties
    
    private let roundedContainer = UIView()
    private let avatarImageView = UIImageView()
    private let fullNameLabel = UILabel()
    private let jobTitleLabel = UILabel()
    private let emailLabel = UILabel()
    private let separators: Separatos = (UIView(), UIView(), UIView())
    
    private var allSeparators: [UIView] {
        [separators.top, separators.middle, separators.bottom]
    }
    
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
    
    override var isHighlighted: Bool {
        didSet {
            let alpha = isHighlighted ? 0.6 : 1.0
            UIView.animate(withDuration: 0.2) {
                self.contentView.alpha = alpha
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            let color: UIColor = isSelected ? .red : .clear
            UIView.animate(withDuration: 0.2) {
                self.roundedContainer.layer.borderColor = color.cgColor
            }
        }
    }
    
    // MARK: - Setup
    
    func setupViews() {
        container.backgroundColor = .white
        container.layer.cornerRadius = 10
        
        roundedContainer.backgroundColor = #colorLiteral(red: 0.768627451, green: 0.7960784314, blue: 0.7647058824, alpha: 1)
        roundedContainer.layer.borderWidth = 1
        roundedContainer.layer.borderColor = UIColor.clear.cgColor
        roundedContainer.layer.cornerRadius = 10
        roundedContainer.layer.shadowOffset = .init(width: 4, height: 4)
        roundedContainer.layer.shadowColor = UIColor.gray.cgColor
        roundedContainer.layer.shadowRadius = 5
        roundedContainer.layer.shadowOpacity = 0.3
        
        fullNameLabel.textColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        fullNameLabel.font = .systemFont(ofSize: 20)
        fullNameLabel.numberOfLines = 0
        
        jobTitleLabel.textColor = .black
        jobTitleLabel.font = .systemFont(ofSize: 17)
        jobTitleLabel.numberOfLines = 0
        jobTitleLabel.textAlignment = .center
        
        emailLabel.textColor = .black
        emailLabel.font = .systemFont(ofSize: 14, weight: .thin)
        emailLabel.numberOfLines = 0
        emailLabel.textAlignment = .right
        
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = 35
        
        allSeparators.forEach {
            $0.backgroundColor = .lightGray.withAlphaComponent(0.4)
        }
    }
    
    func addViews() {
        container.addSubview(roundedContainer)
        roundedContainer.addSubview(avatarImageView)
        roundedContainer.addSubview(fullNameLabel)
        roundedContainer.addSubview(jobTitleLabel)
        roundedContainer.addSubview(emailLabel)
        
        allSeparators.forEach {
            roundedContainer.addSubview($0)
        }
    }
    
    func layoutViews() {
        roundedContainer.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.right.equalToSuperview().inset(10)
        }
        
        separators.top.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(self.emailLabel.snp.bottom).offset(8)
            $0.left.right.equalToSuperview()
        }
        
        avatarImageView.snp.makeConstraints {
            $0.size.equalTo(70)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(self.separators.top.snp.bottom).offset(10)
        }
        
        fullNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.avatarImageView.snp.top)
            $0.left.equalTo(self.avatarImageView.snp.right).offset(10)
            $0.right.equalToSuperview().inset(10)
        }
        
        separators.middle.snp.makeConstraints {
            $0.top.equalTo(self.avatarImageView.snp.bottom).offset(10)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        jobTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.separators.middle.snp.bottom).offset(4)
            $0.left.right.equalTo(10)
        }
        
        separators.bottom.snp.makeConstraints {
            $0.top.equalTo(self.jobTitleLabel.snp.bottom).offset(4)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}

// MARK: - Configure

extension PeopleCell {
    func configure(using model: PeopleCellModel) {
        fullNameLabel.text = model.fullName
        jobTitleLabel.text = model.jobTitle
        emailLabel.text = model.email
        
        model.avatarLink.flatMap { URL(string: $0) }.map {
            avatarImageView.sd_setImage(with: $0)
        }
    }
}

