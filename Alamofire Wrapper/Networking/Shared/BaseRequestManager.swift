//
//  BaseRequestManager.swift
//  Alamofire Wrapper
//
//  Created by Arash Zeinoddini on 6/22/22.
//

import Foundation
import Alamofire

class BaseRequestManager {

    struct Error {
        var errorCode: Int
        var errorDescription: String
    }

    static let URLError = Error(errorCode: 1, errorDescription: "Incorrect URL")

    typealias NetworkingError = (_ error : Error) -> Void
        
    typealias NetworkResponse = (_ data : AFDataResponse<Data?>) -> Void
        
    static func request(url: URL?, method: HTTPMethod, parameters: [String: Any]?, networkingError: @escaping NetworkingError, networkResponse : @escaping NetworkResponse) {
        guard let url = url else {
            networkingError(URLError)
            return
        }
        let headers = configureCurrentSession(method)
        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).response { dataResponse in
            networkResponse(dataResponse)
        }
    }
    
    static func configureCurrentSession(_ method: HTTPMethod) -> HTTPHeaders {
        Session.default.session.configuration.timeoutIntervalForRequest = 10800
        Session.default.session.configuration.timeoutIntervalForResource = 10800
        var headers = Session.default.sessionConfiguration.headers
        switch method {
        case .post:
            headers["Accept"] = "application/json"
            headers["Content-Type"] = "application/json"
        case .get: break
//            headers["Accept"] = "application/json"
//            headers["Content-Type"] = "application/json"
        case .put: break
//            headers["Accept"] = "application/json"
//            headers["Content-Type"] = "application/json"
        default:
            break
        }
//        if(token-value != nil) {
//            headers["Authorization"] = "Bearer token-value"
//        }
        
        return headers
    }

}
