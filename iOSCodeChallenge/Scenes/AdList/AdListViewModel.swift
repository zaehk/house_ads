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
        self.isFavorite = favorite
        
        if let tipology = transaction, let propertyKind = propertyType {
            self.propertyTypeAndTopologyDescription =  String(format: tipology.description, propertyKind.description)
        }else if let propertyKind = propertyType?.description{
            self.propertyTypeAndTopologyDescription = propertyKind.description
        }
        
        if let safePrice = listDTO.price {
            self.price = "\(safePrice)€"
            if transaction == .rent {
                price.append(Literals.Common.priceMonth)
            }
        }
        
        if let safeThumbnail = listDTO.thumbnail{
            images.append(safeThumbnail)
        }
        
        if let imageArray = listDTO.multimedia?.images {
            
            //set imagesURL to the array
            imageArray.forEach({
                if let safeUrl = $0.url {
                    images.append(safeUrl)
                }
            })
            
        }
    }
    
}
