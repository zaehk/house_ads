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
  func presentSomething(response: FavoriteAdsList.Something.Response)
}

class FavoriteAdsListPresenter: FavoriteAdsListPresentationLogic
{
  weak var viewController: FavoriteAdsListDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: FavoriteAdsList.Something.Response)
  {
    let viewModel = FavoriteAdsList.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}