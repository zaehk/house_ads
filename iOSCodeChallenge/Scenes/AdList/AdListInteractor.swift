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
    
    init(adService: AdServiceProtocol = AdService()){
        self.adService = adService
    }
    
    func fetchRealStateAds() {
        adService?.fetchAdList(success: { [weak self] (adsResult) in
            self?.realStateAdsResults = adsResult.elementList
            
            
            
            self?.presenter?.presentRealStateAds(response: adsResult.elementList.map({return ($0,true)}))
        }, failure: { [weak self] (error) in
            self?.presenter?.presentErrorFetchingRealStateAds()
        })
    }
    
    private func fetchIsFavorite() {
        
    }
    
}
