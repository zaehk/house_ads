//
//  FavoriteAdsListInteractor.swift
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

protocol FavoriteAdsListBusinessLogic
{
  func doSomething(request: FavoriteAdsList.Something.Request)
}

protocol FavoriteAdsListDataStore
{
  //var name: String { get set }
}

class FavoriteAdsListInteractor: FavoriteAdsListBusinessLogic, FavoriteAdsListDataStore
{
  var presenter: FavoriteAdsListPresentationLogic?
  var worker: FavoriteAdsListWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: FavoriteAdsList.Something.Request)
  {
    worker = FavoriteAdsListWorker()
    worker?.doSomeWork()
    
    let response = FavoriteAdsList.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
