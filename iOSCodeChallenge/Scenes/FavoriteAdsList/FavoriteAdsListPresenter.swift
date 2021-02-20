//
//  FavoriteAdsListPresenter.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FavoriteAdsListPresentationLogic
{
    func presentFavoriteAds(ads: [IDResultDTO])
    func presentEmptyState()
    
    func presentRemovingFromFavoritesError()
    func presentFavoriteAdsListError()
}

class FavoriteAdsListPresenter: FavoriteAdsListPresentationLogic
{

  weak var viewController: FavoriteAdsListDisplayLogic?
    
    func presentFavoriteAds(ads: [IDResultDTO]) {
        
        if ads.isEmpty {
            presentEmptyState()
        } else {
            //if there are results, we convert it to viewmodels
            let adsViewModels = ads.map({
                AdViewModel.init(listDTO: $0, favorite: true)
            })
            //then we use the viewmodels to populate the ad cell models
            let cellModels = adsViewModels.map({AdCellModel.init(adViewModel: $0)})
            //then we create the whole AdListViewModel populated with the cell models
            let adListViewModel = AdListViewModel.init(cellModelsToShow: cellModels)
            //send it to the view to be shown
            viewController?.showFavoriteAds(viewModel: adListViewModel)
        }
    }
    
    func presentEmptyState() {
        let emptyStateCell = EmptyStateCellModel.init(emptyState: .favorites)
        viewController?.showFavoriteAds(viewModel: AdListViewModel.init(cellModelsToShow: [emptyStateCell]))
    }
    
    func presentRemovingFromFavoritesError() {
        
    }
    
    func presentFavoriteAdsListError() {
        
    }
    
    
    
}
