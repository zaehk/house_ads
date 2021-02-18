//
//  AdListRouter.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.


import UIKit

@objc protocol AdListRoutingLogic
{
    func navigateToAdDetail(adIndex: Int)
}

protocol AdListDataPassing
{
    var dataStore: AdListDataStore? { get }
    
    func passDataToAdDetail(index: Int, source: AdListDataStore, destination: inout AdDetailDataStore)
}

class AdListRouter: NSObject, AdListRoutingLogic, AdListDataPassing
{
    
    weak var viewController: AdListViewController?
    var dataStore: AdListDataStore?
    
    
    func navigateToAdDetail(adIndex: Int) {
        let adDetailVC = AdDetailBuilder.viewController()
        if var adDetailDS = adDetailVC.router?.dataStore, let adListDataStore = dataStore {
            passDataToAdDetail(index: adIndex, source: adListDataStore, destination: &adDetailDS)
        }
        viewController?.navigationController?.pushViewController(adDetailVC, animated: true)
    }
    
    func passDataToAdDetail(index: Int, source: AdListDataStore, destination: inout AdDetailDataStore) {
        destination.idResultDTO = source.realStateAdsResults[index]
    }

}
