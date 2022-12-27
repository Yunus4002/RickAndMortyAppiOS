//
//  Tabbar.swift
//  RickAndMorty
//
//  Created by Asadbek on 27/12/22.
//

import UIKit

class Tabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabs()

    }
    
    private func setUpTabs() {
        
        let firstTab = RMCharacterVC(nibName: "RMCharacterVC", bundle: nil)
        let navVC1 = UINavigationController(rootViewController: firstTab)
        let firstTabItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        navVC1.navigationBar.prefersLargeTitles = true
        navVC1.tabBarItem = firstTabItem
        firstTab.title = "Characters"
        
        let secondTab = RMLocationVC(nibName: "RMLocationVC", bundle: nil)
        let navVC2 = UINavigationController(rootViewController: secondTab)
        let secondTabItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), selectedImage: UIImage(systemName: "globe.fill"))
        navVC2.navigationBar.prefersLargeTitles = true
        navVC2.tabBarItem = secondTabItem
        secondTab.title = "Location"
        
        
        let thirdTab = RMEpisodeVC(nibName: "RMEpisodeVC", bundle: nil)
        let navVC3 = UINavigationController(rootViewController: thirdTab)
        let thirdTabItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), selectedImage: UIImage(systemName: "tv.fill"))
        navVC3.navigationBar.prefersLargeTitles = true
        navVC3.tabBarItem = thirdTabItem
        thirdTab.title = "Episodes"
        
        
        let fourthTab = RMSettingsVC(nibName: "RMSettingsVC", bundle: nil)
        let navVC4 = UINavigationController(rootViewController: fourthTab)
        let fourthTabItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), selectedImage: UIImage(systemName: "gear.fill"))
        navVC4.navigationBar.prefersLargeTitles = true
        navVC4.tabBarItem = fourthTabItem
        fourthTab.title = "Settings"

        
        

        
        
        
        
        
        self.viewControllers = [navVC1,navVC2,navVC3,navVC4]
        
        
    }
    


}
