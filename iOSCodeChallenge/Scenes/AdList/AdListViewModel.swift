//
//  AdListViewMoidel.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/2/21.
//

import Foundation

internal struct AdListViewModel {
    
    let cellModelsToShow: [DrawerItemProtocol]

    
}

internal struct AdViewModel {
    
    var propertyTypeAndTopologyDescription: String = ""
    var propertyType: Property?
    var isFavorite: Bool
    var transaction: TransactionTipology?
    var price: String = ""
    var images: [String] = []
    
    init(listDTO: IDResultDTO, favorite: Bool){
        self.propertyType = Property.init(rawValue: listDTO.propertyType ?? "")
        self.transaction = TransactionTipology.init(rawValue: listDTO.operation ?? "")
        
        if let tipology = transaction, let propertyKind = propertyType {
            self.propertyTypeAndTopologyDescription =  String(format: tipology.description, propertyKind.description)
        }else if let propertyKind = propertyType?.description{
            self.propertyTypeAndTopologyDescription = propertyKind.description
        }
        
        if let safePrice = listDTO.price {
            self.price = "\(safePrice)€"
        }
        
        if let imageArray = listDTO.multimedia?.images {
            images = imageArray.map({$0.url ?? ""})
        }
        
        self.isFavorite = favorite

    }
}
