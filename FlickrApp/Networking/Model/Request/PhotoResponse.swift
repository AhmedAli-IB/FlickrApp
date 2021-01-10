//
//  PhotoResponse.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import Foundation

// MARK: - PhotoMainResponse
//
struct PhotoMainResponse: Codable {
    let photos: Photos?
    let stat: String?
}

// MARK: - Photos
//
struct Photos: Codable {
    let page, pages, perpage: Int?
    let total: String?
    let photo: [PhotoResponse]?
}

// MARK: - PhotoResponse
//
struct PhotoResponse: Codable {
    let id, owner, secret, server, title: String?
    let farm, ispublic, isfriend, isfamily: Int?
}
