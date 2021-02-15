//
//  ApiClientProtocol.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import Foundation

protocol ApiClientProtocol {
    func makeRequest<T>(route: URLRequestConfiguration, responseModel: T.Type, success: @escaping (T) -> Void, failed: @escaping (APIErrorType) -> Void) where T: Decodable
}

protocol ApiServiceProtocol {
    var apiClient: ApiClientProtocol {get}
}
