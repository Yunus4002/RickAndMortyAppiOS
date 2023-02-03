//
//  CharacterLIstViewViewModel.swift
//  RickAndMorty
//
//  Created by Asadbek on 03/01/23.
//

import Foundation
import UIKit
final class  RMCharacterListViewViewModel: NSObject {
    
    private var characters: [RMCharacter] = [ ] {
        didSet {
            for character in characters {
                let viewModel = RMCharacterCVCViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image)
                )
                cellViewModels.append(viewModel)
                
            }
        }
    }
    
    private var cellViewModels: [RMCharacterCVCViewModel] = []
    
    
    
    public func fetchCharacters() {
        
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self) { [ weak self ] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                self?.characters =  results
            case .failure(let error):
                print(String(describing: error))
            }
        }

    }
}
extension RMCharacterListViewViewModel: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    //MARK: -> CollectionDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCVC.cellIdentifier, for: indexPath) as? RMCharacterCVC else {  fatalError("Unsupported")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
        
    }
    //MARK: -> CollectionDelegate
    //
    //
    //
    
    
    //MARK: -> CollectionFlowDelegateLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width * 1.5)
        

    }
    
    
}
