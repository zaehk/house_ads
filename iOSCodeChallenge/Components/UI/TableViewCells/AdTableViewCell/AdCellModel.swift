//
//   AdViewModel.swift
//   iOSCodeChallenge
//
//   Creado por Borja Saez de Guinoa Vilaplana el 13/2/21.

import Foundation

internal final class AdCellModel {
    
    let isFavorite: Bool = false
    
}

// MARK: - DrawerItemProtocol -

extension AdCellModel: DrawerItemProtocol {
    var cellDrawer: CellDrawerProtocol {
        return AdCellDrawer()
    }
}
