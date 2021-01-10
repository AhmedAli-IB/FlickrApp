//
//  BaseURL.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//
import Foundation

// MARK: - Base URL
//
struct BaseURL {
    
    /// Base URL
    ///
    static var url: URL {
        var nsDictionary: NSDictionary?
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist") else {
            fatalError("Unable to retrive info plist path \(#function)")
        }
        // create url from value in info plist
        nsDictionary = NSDictionary(contentsOfFile: path)
        guard let url = URL(string: nsDictionary?["SERVER_URL"] as? String ?? "") else {
            fatalError("Unable to create url \(#function)")
        }
        return url
    }
}
