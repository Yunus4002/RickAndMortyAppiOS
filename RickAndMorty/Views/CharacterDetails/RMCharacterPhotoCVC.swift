//
//  RMCharacterPhotoCVC.swift
//  RickAndMorty
//
//  Created by Asadbek on 02/02/23.
//

import UIKit

class RMCharacterPhotoCVC: UICollectionViewCell {
    
    
    static func nib() -> UINib {
        UINib(nibName: "RMCharacterPhotoCVC", bundle: nil)
    }
    static let identifier: String = "RMCharacterPhotoCVC"
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),

        
        
        
        
        
        ])
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel:RMCharacterPhotoCVCViewModel) {
        //Weak self has been written for LEAK MEMORY Issues which MAY occur
        viewModel.fetchImage { [weak self ] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(data: data)
                }
            case .failure(_):
                print("No picture coming ")
            }
        }
    }
    
    
}
