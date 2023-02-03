//
//  RMCharacterInfoCVC.swift
//  RickAndMorty
//
//  Created by Asadbek on 02/02/23.
//

import UIKit

class RMCharacterInfoCVC: UICollectionViewCell {
    
    static func nib() -> UINib {
        UINib(nibName: "RMCharacterInfoCVC", bundle: nil)
    }
    static let identifier: String = "RMCharacterInfoCVC"
    
    
    private let valueLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .light)
        return label
    }()
    private let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    private let iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    private let titleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        return view
    }()


    
    
    //MARK: - Init
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubviews(valueLable, titleContainerView, iconImageView)
        titleContainerView.addSubview(titleLable)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            titleContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            titleContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.33),
            
            titleLable.leftAnchor.constraint(equalTo: titleContainerView.leftAnchor),
            titleLable.rightAnchor.constraint(equalTo: titleContainerView.rightAnchor),
            titleLable.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            titleLable.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35),
            iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            
        
            valueLable.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 10),
            valueLable.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            valueLable.topAnchor.constraint(equalTo: contentView.topAnchor),
            valueLable.bottomAnchor.constraint(equalTo: titleContainerView.topAnchor)
            



            
            
            
        ])
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLable.text = nil
        titleLable.text = nil
        iconImageView.image = nil
        iconImageView.tintColor = .label
        titleLable.textColor = .label
    }
    
    public func configure(with viewModel:RMCharacterInfoCVCViewModel) {
        
        titleLable.text = viewModel.title
        valueLable.text = viewModel.displayValue
        iconImageView.image = viewModel.iconImage
        iconImageView.tintColor = viewModel.tintColor
        titleLable.textColor = viewModel.tintColor
        
    }
}
