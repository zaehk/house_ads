//
//  AdServiceMock.swift
//  iOSCodeChallengeTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/2/21.
//

@testable import iOSCodeChallenge
import XCTest

enum ExpectedMockResponse {
    case error
    case emptyBodyArray
    case success
}

class AdServiceMock: AdServiceProtocol {
    
    var fetchAdListCalled = false
    var fetchAdDetailCalled = false
    
    var expectedFromAdList : ExpectedMockResponse
    var expectedFromAdDetail : ExpectedMockResponse
    
    func fetchAdList(success: @escaping (IDResultsDTO) -> (), failure: @escaping (APIErrorType) -> ()) {
        fetchAdListCalled = true
        ServiceResponseMock.getResponseForExpectedBehaviour(expected: expectedFromAdList, mockFile: MockFile.adList, success: success, failure: failure)
    }
    
    func fetchAdDetail(adURL: String, success: @escaping (IDDetailDTO) -> (), failure: @escaping (APIErrorType) -> ()) {
        fetchAdDetailCalled = true
        ServiceResponseMock.getResponseForExpectedBehaviour(expected: expectedFromAdDetail, mockFile: MockFile.adDetail, success: success, failure: failure)
    }
    
    var apiClient: ApiClientProtocol
    
    init(expectedAdList: ExpectedMockResponse, expectedAdDetail: ExpectedMockResponse){
        apiClient = ApiClientMock()
        self.expectedFromAdList = expectedAdList
        self.expectedFromAdDetail = expectedAdDetail
    }

}
