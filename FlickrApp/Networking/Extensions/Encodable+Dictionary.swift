//
//  Encodable+Dictionary.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import Foundation

extension Encodable {
    
    /// convert data to dictionary
    /// - Returns: dictionary
    ///
    
    
    
    
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dic = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dic
    }
}
