//
//  ApiClientMock.swift
//  iOSCodeChallengeTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/2/21.
//

@testable import iOSCodeChallenge
import XCTest

class ApiClientMock: ApiClientProtocol {
    
    func makeRequest<T>(route: URLRequestConfiguration, responseModel: T.Type, success: @escaping (T) -> Void, failed: @escaping (APIErrorType) -> Void) where T : Decodable {
        
    }
    
}
