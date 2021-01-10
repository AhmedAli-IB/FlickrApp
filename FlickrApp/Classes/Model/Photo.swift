//
//  Photo.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import Foundation

// MARK: - Photo App Model
/// Photo model contain what exactly properties app need.
//
struct Photo {
    let id, secret, server, title: String
    let farm: Int
}

// MARK: - PhotoRespone Init Helper
//
extension Photo {
    
    init?(photoData data: PhotoResponse) {
        guard
            let id = data.id,
            let secret = data.secret,
            let server = data.server,
            let title = data.title,
            let farm = data.farm else {
            return nil
        }
        self.init(id: id, secret: secret, server: server, title: title, farm: farm)
    }
}
