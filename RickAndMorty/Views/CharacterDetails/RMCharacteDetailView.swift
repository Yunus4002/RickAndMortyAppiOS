//
//  RMCharacteDetailView.swift
//  RickAndMorty
//
//  Created by Asadbek on 09/01/23.
//

import UIKit

/// View for character details when a cell is chosen
final class RMCharacteDetailView: UIView {

    public var collectionView: UICollectionView?
    
    private let viewModel: RMCharacteDetailedViewViewModel
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    //MARK: -> Init
     init(frame: CGRect, viewModel: RMCharacteDetailedViewViewModel) {
         self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints =  false
        backgroundColor = .systemBackground
        let collectionView = createCollectionView()
        self.collectionView = collectionView
        addSubviews(collectionView, spinner)
        addConstaints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    
    private func addConstaints() {
        guard let collectionView = collectionView else {
            return
        }
        NSLayoutConstraint.activate([
            
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),

           

            
            
        ])

        
        
    }
 
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RMCharacterPhotoCVC.self, forCellWithReuseIdentifier: RMCharacterPhotoCVC.identifier)
        collectionView.register(RMCharacterInfoCVC.self, forCellWithReuseIdentifier: RMCharacterInfoCVC.identifier)
        collectionView.register(RMCharacterEpisodeCVC.self, forCellWithReuseIdentifier: RMCharacterEpisodeCVC.identifier)
        
        
        
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }
    
    private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {
        
        
        let sectionTypes = viewModel.sections
        
        switch sectionTypes[sectionIndex] {
        case .photo:
            return viewModel.createPhotoSectionLayout()
        case .information:
            return viewModel.createInfoSectionLayout()
        case .episodes:
            return viewModel.createEpisodeSectionLayout()
            
        }
        
    }
     
    
}
