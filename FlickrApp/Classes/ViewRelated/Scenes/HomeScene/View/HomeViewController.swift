//
//  HomeViewController.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import UIKit

// MARK: - Home View Controller
/// Display list of onlie photos.
///
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }

}

// MARK: - Configuration
//
private extension HomeViewController {
    
    func configureView() {
        self.title = "Home 🤟📸"
    }
}
