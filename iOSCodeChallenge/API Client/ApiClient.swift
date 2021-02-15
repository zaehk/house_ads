//
//  ApiClient.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import Foundation

internal final class ApiClient: ApiClientProtocol {
    
    static let shared = ApiClient()
    
    private init(){
        
    }
    
    // MARK: - Alamofire manager configured with adapter and retrier
    
    private var urlSession: URLSession = {
        let defaultSession = URLSession(configuration: .default)
        return defaultSession
    }()
    
    // MARK: - Api service function which takes the config of the api router, parse and returns the response model or the error.
    
    func makeRequest<T>(route: URLRequestConfiguration,
                        responseModel: T.Type,
                        success: @escaping (T) -> Void,
                        failed: @escaping (APIErrorType) -> Void) where T: Decodable {
        
        guard let request = route.asURLRequest() else {
            DispatchQueue.main.async {
                failed(APIErrorType.generalServiceError)
            }
            return
        }
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            if error != nil || data == nil {
                DispatchQueue.main.async {
                    failed(APIErrorType.generalServiceError)
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, (ApiParameters.validationRange).contains(response.statusCode) else {
                DispatchQueue.main.async {
                    failed(APIErrorType.badRequestError)
                }
                return
            }
            
            
            guard let safeData = data else {
                DispatchQueue.main.async {
                    failed(APIErrorType.jsonParsingError)
                }
                return
            }
            
            let jsonDecoder = JSONDecoder()
            if let parsedObject = try? jsonDecoder.decode(T.self, from: safeData) {
                DispatchQueue.main.async {
                    success(parsedObject)
                }
            } else {
                DispatchQueue.main.async {
                    failed(APIErrorType.jsonParsingError)
                }
            }
            
        }
        
        dataTask.resume()
        
    }
}
