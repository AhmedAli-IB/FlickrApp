//
//  Home+ErrorHandling.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import Foundation

extension HomeError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .unableToGetPhotos:
            return "Couldn't get these info now, please try again later"
        }
    }
}
