//
//  HomeTableViewCell.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    //
    @IBOutlet private  weak var photoImageView: UIImageView!
    
    // MARK: - Properties
    
    var viewModel: ImageRepresentable? {
        didSet {
            configureCell()
        }
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
}

// MARK: - Configure
//
private extension HomeTableViewCell {
    
    /// Configure home cell
    ///
    func configureCell() {
        photoImageView.setImage(representable: viewModel)
    }
    /// ConfigureView
    ///
    func configureView() {
        photoImageView.layer.cornerRadius = Constants.cornerRadius
    }
}

// MARK: - Constants
//
private extension HomeTableViewCell {
    enum Constants {
        static let cornerRadius = CGFloat(8)
    }
}
