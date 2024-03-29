//
//  HomeViewModel.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import Foundation

// MARK: - Home View Model
//
class HomeViewModel: BaseViewModel {
    
    // MARK: - Callbacks
    //
    var onReload: (() -> Void)?
    
    // MARK: - Properties
    //
    private let photoServiceLocator: HomeServiceLocatorProtocol
    private var photos: [Photo] = []
    
    // MARK: - Init
    //
    init(photoServiceLocator: HomeServiceLocatorProtocol = HomeServiceLocator()) {
        self.photoServiceLocator = photoServiceLocator
    }
    
    /// Number of rowss
    ///
    var numberOfRows: Int {
        photos.count
    }
    
    func getCurrentObject(for indexPath: IndexPath) -> Photo {
        return photos[indexPath.row]
    }
}

// MARK: - Handlers
//
extension HomeViewModel {
    
    /// Get photos from service locator and return with photos or error
    /// - Parameter text: What you search for's
    func getPhotos(searchText text: String) {
        
        self.state.send(.loading)
        
        photoServiceLocator.getPhotos(searchText: text) { [weak self](result) in
            
            guard let self = self else { return }
            switch result {
            case .success(let photos):
                self.photos = photos
                self.onReload?()
                self.state.send(.success)
            case .failure(let error):
                self.state.send(.failure(error.localizedDescription))
            }
        }
    }
}
