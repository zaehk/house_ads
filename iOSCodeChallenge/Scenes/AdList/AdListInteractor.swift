//
//  AdListInteractor.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.


import UIKit

protocol AdListBusinessLogic
{
    func fetchRealStateAds()
    func toggleFavoriteStatus(index: Int)
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
            self?.fetchFavoriteStatusFromLocalDB(responseModels: adsResult.elementList)
        }, failure: { [weak self] (error) in
            self?.presenter?.presentErrorFetchingRealStateAds()
        })
    }
    
    func toggleFavoriteStatus(index: Int) {
        let adToBeToggled = self.realStateAdsResults[index]
            
        adLocalService?.toggleFavoriteStatus(idResultDTO: adToBeToggled, success: { [weak self] (newStatus) in
            self?.presenter?.presentToggledFavorite(idResultDTO: adToBeToggled, newStatus: newStatus, indexToReplace: index)
        }, failure: { (persistenceError) in
            //present error
        })
        
    }
    
    private func fetchFavoriteStatusFromLocalDB(responseModels: [IDResultDTO]) {
        var resultsWithFavoriteStatus: [(IDResultDTO,Bool)] = []
        
        for responseModel in responseModels {
            self.adLocalService?.checkIfIsFavorite(adId: responseModel.propertyCode ?? "", success: {
                resultsWithFavoriteStatus.append((responseModel,true))
            }, failure: { (error) in
                resultsWithFavoriteStatus.append((responseModel,false))
            })
        }
        self.presenter?.presentRealStateAds(response: resultsWithFavoriteStatus)
    }
    
}
