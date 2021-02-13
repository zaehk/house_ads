//
//  AdListInteractor.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.


import UIKit

protocol AdListBusinessLogic
{
  func doSomething(request: AdList.Something.Request)
}

protocol AdListDataStore
{
  //var name: String { get set }
}

class AdListInteractor: AdListBusinessLogic, AdListDataStore
{
  var presenter: AdListPresentationLogic?
  var worker: AdListWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: AdList.Something.Request)
  {
    worker = AdListWorker()
    worker?.doSomeWork()
    
    let response = AdList.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
