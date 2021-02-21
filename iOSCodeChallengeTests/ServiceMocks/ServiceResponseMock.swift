//
//  ServiceResponseMock.swift
//  iOSCodeChallengeTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 21/2/21.
//

@testable import iOSCodeChallenge
import XCTest

class ServiceResponseMock {
    
    static func getResponseForExpectedBehaviour<T: Decodable>(expected: ExpectedMockResponse, mockFile: MockFileConstant, success: @escaping(T)->(), failure: @escaping(APIErrorType)->()){
        switch expected {
        case .error:
            failure(APIErrorType.badRequestError)
        case .emptyBodyArray:
            success(JSONMockDecoder.decode(mock: mockFile.errorOrEmpty))
        case .success:
            success(JSONMockDecoder.decode(mock: mockFile.success))
        }
    }
    
}
