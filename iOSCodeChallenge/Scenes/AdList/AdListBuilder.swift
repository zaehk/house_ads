//
//  AdListBuilder.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.

import UIKit

class AdListBuilder {

    class func viewController() -> AdListViewController {

        let viewController = AdListViewController()
        // connecting all components together
        let interactor = AdListInteractor()
        let presenter = AdListPresenter()
        let router = AdListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor

        return viewController
    }
}
