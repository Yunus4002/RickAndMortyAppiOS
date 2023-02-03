//
//  RMEpisodeDetailVC.swift
//  RickAndMorty
//
//  Created by Asadbek on 04/02/23.
//

import UIKit

/// VC for a single episode
final class RMEpisodeDetailVC: UIViewController {

    private let url: URL?
    
    //MARK: - Init
    
    init(url: URL?) {
        self.url = url
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    //MARK: App LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        title = "Episodes"
        
    }
    


}
