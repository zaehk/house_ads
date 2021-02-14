//
//  AdListInteractor.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.


import UIKit

protocol AdListBusinessLogic
{
    func fetchRealStateAds()
}

protocol AdListDataStore
{
    var realStateAdsResuolts: [IDResultDTO] { get set }
}

class AdListInteractor: AdListBusinessLogic, AdListDataStore
{
    var realStateAdsResuolts: [IDResultDTO] = []

    var presenter: AdListPresentationLogic?
    
    func fetchRealStateAds() {
        let resultListURL = URL(string: "https://www.mocky.io/v3/364d4f62-c183-4f12-ba16-49bfc5c820ab")!

        var urlRequest = URLRequest(url: resultListURL)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let data = data, error == nil {
                let jsonDecoder = JSONDecoder()
                if let results = try? jsonDecoder.decode(IDResultsDTO.self, from: data) {
                    DispatchQueue.main.async {
                        let fakeFavoriteList = results.elementList.map({($0,false)})
                        self.presenter?.presentRealStateAds(response: fakeFavoriteList)
                    }
                }
            } else if let _ = error {
                
            }
        }.resume()
        
        
    }
    
}
