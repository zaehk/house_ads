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
    var realStateAdsResults: [IDResultDTO] { get set }
}

class AdListInteractor: AdListBusinessLogic, AdListDataStore
{
    var realStateAdsResults: [IDResultDTO] = []

    var presenter: AdListPresentationLogic?
    var adService: AdServiceProtocol?
    var adLocalService: AdLocalServiceProtocol?
    
    init(adService: AdServiceProtocol = AdService(), adLocalService: AdLocalServiceProtocol = AdLocalService()){
        self.adService = adService
        self.adLocalService = adLocalService
    }
    
    func fetchRealStateAds() {
        adService?.fetchAdList(success: { [weak self] (adsResult) in
            self?.realStateAdsResults = adsResult.elementList
            
            
            
            self?.presenter?.presentRealStateAds(response: adsResult.elementList.map({return ($0,true)}))
        }, failure: { [weak self] (error) in
            self?.presenter?.presentErrorFetchingRealStateAds()
        })
    }
    
    private func fetchFavoriteStatusFromLocalDB(responseModels: [IDResultDTO]) {
            
        var resultsWithFavoriteStatus: [(IDResultDTO,Bool)] = []
  
        DispatchQueue.global().async {
            DispatchQueue.concurrentPerform(iterations: responseModels.count) { [weak self] (index) in
                self?.adLocalService?.fetchFavorite(adId: responseModels[index].propertyCode ?? "", success: {
                    resultsWithFavoriteStatus.append((responseModels[index],true))
                }, failure: { (error) in
                    //we can check type of error..
                    resultsWithFavoriteStatus.append((responseModels[index],false))
                })
            }
            self.presenter?.presentRealStateAds(response: resultsWithFavoriteStatus)
        }
    }
    
}
