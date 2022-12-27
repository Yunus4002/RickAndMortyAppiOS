//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Asadbek on 27/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = Tabbar()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }



}

