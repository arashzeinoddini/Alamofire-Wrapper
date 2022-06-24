//
//  Servers.swift
//  Alamofire Wrapper
//
//  Created by Arash Zeinoddini on 6/22/22.
//

import Foundation

enum Servers: String {
    case flickrBaseUrl = "https://www.flickr.com/services/rest/?"
    case flickrImageBaseUrl = "https://farm%@.staticflickr.com/"
}

enum ServerType {
    case defined(Servers)
    case custom(String)
    var value: String {
        switch self {
        case .defined(let servers):
            return servers.rawValue
        case .custom(let url):
            return url
        }
    }
}
