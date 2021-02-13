//
//  AdListViewController.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.


import UIKit

protocol AdListDisplayLogic: class
{
  
}

class AdListViewController: UITableViewController, AdListDisplayLogic
{
  var interactor: AdListBusinessLogic?
  var router: (NSObjectProtocol & AdListRoutingLogic & AdListDataPassing)?



  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    //doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
//  func doSomething()
//  {
////    let request = AdList.Something.Request()
////    interactor?.doSomething(request: request)
//  }
//  
//  func displaySomething(viewModel: AdList.Something.ViewModel)
//  {
//    //nameTextField.text = viewModel.name
//  }
}
