//
//  AdListPresenter.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

protocol AdListPresentationLogic
{
    func presentRealStateAds(response: [(adListResult:IDResultDTO, isFavorite:Bool)])
    func presentErrorFetchingRealStateAds()
}

class AdListPresenter: AdListPresentationLogic
{
    
    weak var viewController: AdListDisplayLogic?
    
    // MARK: Do something
    
    func presentRealStateAds(response: [(adListResult:IDResultDTO, isFavorite:Bool)]) {
        
        if response.isEmpty {
            //if the response array is empty, we let the user know showing the empty state
            presentEmptyState()
        } else {
            //if there are results, we convert it to viewmodels
            let adsViewModels = response.map({
                AdViewModel.init(listDTO: $0.adListResult, favorite: $0.isFavorite)
            })
            //then we use the viewmodels to populate the ad cell models
            let cellModels = adsViewModels.map({AdCellModel.init(adViewModel: $0)})
            //then we create the whole AdListViewModel populated with the cell models
            let adListViewModel = AdListViewModel.init(cellModelsToShow: cellModels)
            //send it to the view to be shown
            viewController?.showRealStateAds(viewModel: adListViewModel)
        }
    }
    
    private func presentEmptyState() {
        let emptyCell = EmptyStateCellModel.init(emptyState: .adList)
        viewController?.showEmptyState(viewModel: AdListViewModel.init(cellModelsToShow: [emptyCell]))
    }
    
    func presentErrorFetchingRealStateAds() {
        //add error state
        presentEmptyState()
    }
    
}
