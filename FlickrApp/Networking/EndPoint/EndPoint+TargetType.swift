//
//  EndPoint+TargetType.swift
//  FlickrApp
//
//  Created by Ahmed Ali on 10/01/2021.
//

import Foundation
import Moya

// MARK: - EndPoint + TargetType
//
extension AppEndPoint: TargetType {
    
    var baseURL: URL {
        return Environment.rootURL
    }
    
    var path: String {
        switch self {
        
        // MARK: - Home
        
        case .getPhotos:
            return "services/rest"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        
        // MARK: - Home
        
        case .getPhotos(let request):
            let parameters = try? request.asDictionary()
            return .requestParameters(parameters: parameters ?? [:], encoding: URLEncoding.default)
            
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
}
