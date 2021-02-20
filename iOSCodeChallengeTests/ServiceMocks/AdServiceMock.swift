//
//  AdServiceMock.swift
//  iOSCodeChallengeTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/2/21.
//

@testable import iOSCodeChallenge
import XCTest

class AdServiceMock: AdServiceProtocol {
    
    var fetchAdListCalled = false
    var fetchAdDetailCalled = false
    
    func fetchAdList(success: @escaping (IDResultsDTO) -> (), failure: @escaping (APIErrorType) -> ()) {
        fetchAdListCalled = true
    }
    
    func fetchAdDetail(adURL: String, success: @escaping (IDDetailDTO) -> (), failure: @escaping (APIErrorType) -> ()) {
        fetchAdDetailCalled = true
    }
    
    var apiClient: ApiClientProtocol
    
    init(){
        apiClient = ApiClientMock()
    }

}
