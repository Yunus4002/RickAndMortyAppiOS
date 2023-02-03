//
//  RMCharacterEpisodeCVC.swift
//  RickAndMorty
//
//  Created by Asadbek on 02/02/23.
//

import UIKit
import Foundation

class RMCharacterEpisodeCVC: UICollectionViewCell {
    
    static func nib() -> UINib {
        UINib(nibName: "RMCharacterEpisodeCVC", bundle: nil)
    }
    static let identifier: String = "RMCharacterEpisodeCVC"

    
    
    
    private let seasonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    
    private let airDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        contentView.addSubviews(seasonLabel, nameLabel, airDateLabel)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            seasonLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            seasonLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            seasonLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10 ),
            seasonLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
             
            nameLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10 ),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10 ),
            nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            airDateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10 ),
            airDateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10 ),
            airDateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3)
            
            
        ])
        
        
        
        
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        seasonLabel.text = nil
        nameLabel.text = nil
        airDateLabel.text = nil
    }
    
    /// Bu func cell ichiga API dan ma'lumotlarni to'g'ridan to'g'ri joylashtirish uchun qilindu
    /// - Parameter viewModel: viewModel
    public func  configure(with viewModel: RMCharacterEpisodeCVCViewModel) {
        viewModel.registerForDate { [ weak self ] data in
            //MARK: Main Queue
            self?.nameLabel.text = "Episode "+data.name
            self?.airDateLabel.text = "Aired on "+data.air_date
            self?.seasonLabel.text = data.episode
            
            
        }
        
        viewModel.fetchEpisode()
    }
}
