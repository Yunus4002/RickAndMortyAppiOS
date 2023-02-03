//
//  RMCharacterVC.swift
//  RickAndMorty
//
//  Created by Asadbek on 27/12/22.
//

import UIKit

class RMCharacterVC: UIViewController,RMCharacterListViewDelegate {
    
    private let characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()

    }
    func setUpView() {
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint
            .activate([
                characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
                characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    //MARK: -> rmCharacterListViewDelegate
    
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        // This is meant to open detail page of a character
        let viewModel = RMCharacteDetailedViewViewModel(character: character)
        let detailVC = RMCharacteDetailedVC(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
}
