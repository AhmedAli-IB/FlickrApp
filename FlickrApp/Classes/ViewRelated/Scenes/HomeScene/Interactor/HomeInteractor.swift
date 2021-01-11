//
//  HomeInteractor.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import Foundation

protocol HomeInteractorProtocol {
    func getPhotos(searchText text: String, onCompletion: @escaping (Result<[Photo], Error>) -> Void)
}

// MARK: - Photo Interactor
/// Home interactor interact with remote and local to make CRUD operation in photo model
///
class HomeInteractor: HomeInteractorProtocol {
    
    typealias PhotoCompletion = (Result<[Photo], Error>) -> Void
    
    // MARK: - Properties
    //
    private let  network = NetworkManager()
    
    // MARK: - Handlers
    //
    
    /// get photos from remot server
    /// - Parameters:
    ///   - text: What you search for's
    func getPhotos(searchText text: String, onCompletion: @escaping PhotoCompletion) {
        
        let request = PhotoRequest(searchText: text)
        network.request(.getPhotos(request)) { (result: Result<PhotoMainResponse, Error>) in
            switch result {
            
            case .success(let data):
                
                guard  let photosData = data.photos?.photo else {
                    onCompletion(.failure(HomeError.unableToGetPhotos))
                    return
                }
                var photos: [Photo]  = []
                photosData.forEach {
                    guard let photo = Photo(photoData: $0) else { return }
                    photos.append(photo)
                }
                
                onCompletion(.success(photos))
                
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
}

// MARK: - Error
//
enum HomeError: Error {
    case unableToGetPhotos
}
