//
//  HomeCoordinator.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import UIKit

// MARK: - HomeCoordinator
//

final class HomeCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Handlers
    
    func start() {
        showHomeViewController()
    }
    
    /// show home flow
    private func showHomeViewController() {
        let viewController = HomeViewController()
        viewController.coordinator = self
        self.navigationController.setViewControllers([viewController], animated: false)
    }

}

// MARK: - conform home navigation action navigator
//
extension HomeCoordinator: HomeCoordinatorProtocol {

    func showDetails(photo: Photo) {
        let viewModel = DetailsViewModel(photo: photo)
        let viewController = DetailsViewController(viewModel: viewModel)
//        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

}
