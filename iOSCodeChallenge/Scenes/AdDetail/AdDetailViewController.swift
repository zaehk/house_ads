//
//  AdDetailViewController.swift
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

protocol AdDetailDisplayLogic: class
{
  func displaySomething(viewModel: AdDetail.Something.ViewModel)
}

class AdDetailViewController: UIViewController, AdDetailDisplayLogic
{
  var interactor: AdDetailBusinessLogic?
  var router: (NSObjectProtocol & AdDetailRoutingLogic & AdDetailDataPassing)?

  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = AdDetail.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: AdDetail.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}