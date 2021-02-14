//
//   AdImageViewModel.swift
//   iOSCodeChallenge
//
//   Creado por Borja Saez de Guinoa Vilaplana el 14/2/21.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation
internal final class AdImageCollectionCellModel {
    
    var imageUrl: String
    
    init(url: String){
        self.imageUrl = url
    }
}

// MARK: - DrawerItemProtocol -

extension AdImageCollectionCellModel: CollectionDrawerItemProtocol {
    var collectionDrawer: CollectionDrawerProtocol {
        return AdImageDrawer()
    }
}
