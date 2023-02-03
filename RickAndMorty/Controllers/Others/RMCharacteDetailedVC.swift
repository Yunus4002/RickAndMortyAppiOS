//
//  RMCharacteDetailedVC.swift
//  RickAndMorty
//
//  Created by Asadbek on 09/01/23.
//

import UIKit

/// Controller to show info about a character chosen
final class RMCharacteDetailedVC: UIViewController {
    private let viewModel: RMCharacteDetailedViewViewModel
    
    private var detailView: RMCharacteDetailView
    
    //MARK: -> Init
    
    
    
    init(viewModel: RMCharacteDetailedViewViewModel) {
        self.viewModel = viewModel
        self.detailView = RMCharacteDetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: -> LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = viewModel.title
        view.addSubview(detailView)
        addConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionTapped))
//        viewModel.fetchCharacterData()
        
        detailView.collectionView?.delegate = self
        detailView.collectionView?.dataSource = self
    }
    
    @objc private func actionTapped() {
        //Bosildi
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
            
            
            
            ])
        
    }
    
    


}
//MARK: -> CollectionView

extension RMCharacteDetailedVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = viewModel.sections[section]
        
        switch sectionType {
            
        case .photo:
            return 1
        case .information(viewModels: let viewModels):
            return viewModels.count
        case .episodes(viewModels: let viewModels):
            return viewModels.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let sectionType = viewModel.sections[indexPath.section]
        
        switch sectionType {
            
        case .photo(let viewModel):
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterPhotoCVC.identifier, for: indexPath) as? RMCharacterPhotoCVC else { return UICollectionViewCell() }
            
            cell.configure(with: viewModel)
            return cell
        case .information(viewModels: let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterInfoCVC.identifier, for: indexPath) as? RMCharacterInfoCVC else { return UICollectionViewCell() }
            cell.configure(with: viewModels[indexPath.row])
            
            return cell
        case .episodes(viewModels: let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterEpisodeCVC.identifier, for: indexPath) as? RMCharacterEpisodeCVC else { return UICollectionViewCell()
            }
            let viewModel = viewModels[indexPath.row]
            cell.configure(with: viewModel)
            return cell
        }
        

    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionType = viewModel.sections[indexPath.section]
        switch sectionType {
        case .photo , .information:
            break
        case .episodes:
            let episodes = self.viewModel.episodes
            let selection = episodes[indexPath.row]
            let vc = RMEpisodeDetailVC(url: URL(string: selection))
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
