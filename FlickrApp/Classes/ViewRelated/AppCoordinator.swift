//
//  AppCoordinator.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()

    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.start()
         
    }
}
