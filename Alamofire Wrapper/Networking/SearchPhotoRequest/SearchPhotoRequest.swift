//
//  GetRecentPhotoRequest.swift
//  Alamofire Wrapper
//
//  Created by Arash Zeinoddini on 6/24/22.
//

import Foundation
import UIKit
import SwiftyJSON

class SearchPhotoRequest: BaseRequestManager {
    
    typealias SearchPhotoCallback = (_ error: Error?, _ photos: Photos?) -> Void
    
    static func request(searchTerm: String, callback: @escaping SearchPhotoCallback) {
        
        let url = URL(server: .defined(.flickrBaseUrl), method: "flickr.photos.search", text: searchTerm, apiKey: Constants.flickrApiKey, format: "json", perPage: 20, page: 1)
        
        BaseRequestManager.request(url: url, method: .get) { error in
            callback(URLError,nil)
            return
        } networkResponse: { response in
            switch response.result {
            case .success(let result) :
                guard let result = result else {
                    callback(nilItemsError, nil)
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let pohtosResponseModel = try decoder.decode(PohtosResponseModel.self, from: result)
//                    print(pohtosResponseModel)
                    callback(nil, pohtosResponseModel.photos)
                    return
                } catch {
                    callback(parseError, nil)
                    print(error.localizedDescription)
                    return
                }
            case .failure(let error) :
                callback(failedResultError, nil)
                print(error.localizedDescription)
                return
            }
        }
    
    }
}
