//
//   AdViewModel.swift
//   iOSCodeChallenge
//
//   Creado por Borja Saez de Guinoa Vilaplana el 13/2/21.

import Foundation

internal final class AdCellModel {
    
    let isFavorite: Bool
    let price: String
    let description: String
    let imagesURL: [String]
    
    init(adViewModel: AdViewModel){
        self.price = adViewModel.price
        self.isFavorite = adViewModel.isFavorite
        self.description = adViewModel.propertyTypeAndTopologyDescription
        self.imagesURL = adViewModel.images
    }
    
}

// MARK: - DrawerItemProtocol -

extension AdCellModel: DrawerItemProtocol {
    var cellDrawer: CellDrawerProtocol {
        return AdCellDrawer()
    }
}
