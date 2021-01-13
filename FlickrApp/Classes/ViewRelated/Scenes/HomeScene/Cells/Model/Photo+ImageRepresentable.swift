//
//  Photo+ImageRepresentable.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import UIKit

extension Photo: ImageRepresentable {
    
    var placeholderImage: UIImage? {
        Asset.Assets.placeholder.image
    }

    var imageURL: String? {
        return "http://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
    }

}
