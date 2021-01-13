//
//  PhotoRequest.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import Foundation

struct PhotoRequest: Encodable {

    let method: String = "flickr.photos.search"
    let apikey: String = Environment.apiKey
    let format: String  = "json"
    let safeSearch: Int = 1
    let noJsonCallBack: Int = 1
    let searchText: String
    
    // MARK: - Init
    //
    init(searchText: String) {
        self.searchText = searchText
    }
    
    enum CodingKeys: String, CodingKey {
        case method, format
        case noJsonCallBack = "nojsoncallback"
        case safeSearch = "safe_search"
        case apikey = "api_key"
        case searchText = "text"
    }

}
