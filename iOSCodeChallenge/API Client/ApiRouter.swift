//
//  ApiRouter.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import Foundation

protocol URLRequestConfiguration {
    var method: HTTPMethod {get}
    var path: String {get}
    func asURLRequest() -> URLRequest?
}

enum HTTPMethod: String {
    case get = "GET"
}

//enum to organize all the info needed to perform every call of the app

internal enum ApiRouter {
    case adList
    case adDetail(url: String)

}

extension ApiRouter: URLRequestConfiguration {
    
    var method: HTTPMethod {
        switch self{
        
        case .adList, .adDetail:
            return .get
        }
    }
    
    var path: String {
        switch self{
        case .adList:
            return ApiEndpoints.BaseURL.adList
        case .adDetail(let detailUrl):
            return detailUrl
        }
    }

    
    func asURLRequest() -> URLRequest? {

        var urlRequest : URLRequest
        
        guard let url = URL.init(string: path) else {return nil}
        
        //Create urlRequest
        urlRequest = URLRequest(url: url)
        
        //Set method
        urlRequest.httpMethod = method.rawValue
        
        //Remove cache
        urlRequest.cachePolicy = .reloadIgnoringCacheData
        
        //Set max timeout time
        urlRequest.timeoutInterval = ApiParameters.requestTimeOut
                
        return urlRequest
    }
    
}
