//
//  UIViewController+Loadding.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import UIKit

// MARK: - Loading
//
extension BaseViewController {

    func shouldShowProgressView(_ show: Bool) {
        DispatchQueue.main.async {
            show ? self.showActivityIndicator() : self.hideActivityIndicator()
        }
    }
    /// Show activity Indicator
    func showActivityIndicator() {
        
        activityView.color = .black
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()

    }
    /// Hide activity indicator
    func hideActivityIndicator() {
        activityView.stopAnimating()
    }
}
