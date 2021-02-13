//
//  AdListPresenter.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

protocol AdListPresentationLogic
{
  func presentSomething(response: AdList.Something.Response)
}

class AdListPresenter: AdListPresentationLogic
{
  weak var viewController: AdListDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: AdList.Something.Response)
  {
    let viewModel = AdList.Something.ViewModel()
    //viewController?.displaySomething(viewModel: viewModel)
  }
}
