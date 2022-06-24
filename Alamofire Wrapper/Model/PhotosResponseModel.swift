//
//  PhotosResponseModel.swift
//  Alamofire Wrapper
//
//  Created by Arash Zeinoddini on 6/24/22.
//

import Foundation

struct PohtosResponseModel: Codable {
    let photos: Photos?
    let stat: String?
}

struct Photos: Codable {
    let page, pages, perpage, total: Int?
    let photo: [Photo]?
}

struct Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String?
    let ispublic, isfriend, isfamily: Int?
    func flickrImageURL(_ size:String = "m") -> URL? {
        var urlStr = String.init(format: Servers.flickrImageBaseUrl.rawValue,"\(farm)")
        urlStr += "\(server)/\(id)_\(secret)_\(size).jpg"
        if let url =  URL(string: urlStr) {
            return url
        }
        return nil
    }
}
