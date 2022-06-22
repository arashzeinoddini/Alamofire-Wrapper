//
//  URLExtension.swift
//  Alamofire Wrapper
//
//  Created by Arash Zeinoddini on 6/22/22.
//

import Foundation

extension URL {
    init?(server: ServerType, method : String = "") {
        let urlStr = server.value + method
        guard let url = URL(string: urlStr) else {
            print("Invalid URL : \(urlStr)")
            return nil
        }
        self = url
    }
}
