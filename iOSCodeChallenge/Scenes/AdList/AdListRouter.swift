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
}

class AdListRouter: NSObject, AdListRoutingLogic, AdListDataPassing
{
    
    weak var viewController: AdListViewController?
    var dataStore: AdListDataStore?
    
    
    func navigateToAdDetail(adIndex: Int) {
        let adDetailVC = AdDetailBuilder.viewController()
        if var adDetailDS = adDetailVC.router?.dataStore, let adListDataStore = dataStore {
            
        }
    }
    
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: AdListViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: AdListDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
