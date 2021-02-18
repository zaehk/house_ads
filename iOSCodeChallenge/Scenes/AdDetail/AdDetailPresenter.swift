//
//  AdDetailPresenter.swift
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

protocol AdDetailPresentationLogic
{
    func presentAdDetail(idDetailDTO: IDDetailDTO, isFavorite: Bool)
    func presentError()
    func presentFavoriteError()
}

class AdDetailPresenter: AdDetailPresentationLogic
{
    
    weak var viewController: AdDetailDisplayLogic?
    
    func presentAdDetail(idDetailDTO: IDDetailDTO, isFavorite: Bool) {
        let viewModel = AdDetailViewModel.init(idDetailDTO: idDetailDTO, isFavorite: isFavorite)
        viewController?.showAdDetail(viewModel: viewModel)
    }
    
    func presentError() {
        viewController?.showAdDetailError()
    }
    
    func presentFavoriteError() {
        viewController?.showFavoriteError()
    }
}
