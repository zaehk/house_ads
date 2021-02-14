//
//  AdListPresenter.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

protocol AdListPresentationLogic
{
    func presentRealStateAds(response: [IDResultDTO])
    func presentErrorFetchingRealStateAds()
}

class AdListPresenter: AdListPresentationLogic
{
    
    weak var viewController: AdListDisplayLogic?
    
    // MARK: Do something
    
    func presentRealStateAds(response: [IDResultDTO]) {
        
        //parse to viewmodel
        
        
        //viewcontroller.showRealStateAds()
        
    }
    
    func presentErrorFetchingRealStateAds() {
        //create empty state view
        
        //viewcontroller.showEmptyState()
    }
    
}
