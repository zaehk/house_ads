//
//   EmptyStateViewModel.swift
//   iOSCodeChallenge
//
//   Creado por Borja Saez de Guinoa Vilaplana el 14/2/21.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation

internal final class EmptyStateCellModel {
    
    var emptyState: EmptyState
    
    init(emptyState: EmptyState){
        self.emptyState = emptyState
    }
    
}

// MARK: - DrawerItemProtocol -

extension EmptyStateCellModel: DrawerItemProtocol {
    var cellDrawer: CellDrawerProtocol {
        return EmptyStateDrawer()
    }
}
