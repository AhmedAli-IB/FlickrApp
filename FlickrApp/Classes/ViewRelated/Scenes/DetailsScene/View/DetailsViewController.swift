//
//  DetailsViewController.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import UIKit

class DetailsViewController: BaseViewController {

    // MARK: - IBOutlet
    //
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!
    
    // MARK: - Properties
    //
    private var viewModel: DetailsViewModel
    
    // MARK: - Init
    //
    required init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureOnReceivePhotoValue()
        viewModel.viewDidload()
    }
}

// MARK: - Configurations
//
private extension DetailsViewController {
    
    /// Configure view
    ///
    func configureView() {
        self.title = Strings.title
    }

    /// Configure on form values update
    //
    func configureOnReceivePhotoValue() {
        
        viewModel.title.subscribe { [weak self] value in
            self?.titleLabel.text = value
        }
        
        viewModel.imageUrl.subscribe { [weak self] value in
            self?.photoImageView.setImage(urlString: value, placeholder: Asset.placeholder.image)
        }
    }
}
// MARK: - Strings
//
private extension DetailsViewController {
    enum Strings {
       static var title = "Details 💪"
   }
}
