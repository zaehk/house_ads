//
//  AdService.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 15/2/21.
//

import Foundation

protocol AdServiceProtocol: ApiServiceProtocol{
    
    func fetchAdList(success:@escaping(IDResultsDTO)->(), failure: @escaping(APIErrorType)-> ())
    func fetchAdDetail(adURL: String, success:@escaping(IDDetailDTO)->(), failure: @escaping(APIErrorType)-> ())
    
}

class AdService: AdServiceProtocol {

    var apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol = ApiClient.shared) {
        self.apiClient = apiClient
    }
    
    func fetchAdList(success: @escaping (IDResultsDTO) -> (), failure: @escaping(APIErrorType) -> ()) {
        apiClient.makeRequest(route: ApiRouter.adList, responseModel: IDResultsDTO.self, success: success, failed: failure)
    }
    
    func fetchAdDetail(adURL: String, success: @escaping (IDDetailDTO) -> (), failure: @escaping (APIErrorType) -> ()) {
        apiClient.makeRequest(route: ApiRouter.adDetail(url: adURL), responseModel: IDDetailDTO.self, success: success, failed: failure)
    }
    
}
