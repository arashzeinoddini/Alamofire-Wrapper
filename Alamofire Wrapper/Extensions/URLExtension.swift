//
//  URLExtension.swift
//  Alamofire Wrapper
//
//  Created by Arash Zeinoddini on 6/22/22.
//

import Foundation

extension URL {
    
    // Flickr initialize
    init?(server: ServerType, method : String , text: String, apiKey: String, format: String, perPage: Int, page: Int) {
        let urlStr = "\(server.value)method=\(method)&text=\(text)&api_key=\(apiKey)&format=\(format)&per_page=\(perPage)&page=\(page)&nojsoncallback=1"
        guard let url = URL(string: urlStr) else {
            print("Invalid URL : \(urlStr)")
            return nil
        }
        self = url
    }
    
    // Common initialize
    init?(server: ServerType, method : String = "") {
        let urlStr = server.value + method
        guard let url = URL(string: urlStr) else {
            print("Invalid URL : \(urlStr)")
            return nil
        }
        self = url
    }
    
}
