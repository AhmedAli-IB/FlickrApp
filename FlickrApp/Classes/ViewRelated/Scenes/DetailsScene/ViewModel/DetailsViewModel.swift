//
//  DetailsVeiwModel.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import Foundation

// MARK: - Details View Model
/// Display title and larg photo
///
class DetailsViewModel: BaseViewModel {
    
    // MARK: - Properties
    //
    private var photo: Photo!
    
    var title = BehaviorSubject<String?>(nil)
    var imageUrl = BehaviorSubject<String?>(nil)
    
    // MARK: - Init
    init(photo: Photo) {
        self.photo = photo
    }
}

// MARK: - Handlers

extension DetailsViewModel {
    func viewDidload() {
        title.send(photo.title)
        imageUrl.send(photo.imageURL)
    }
}
