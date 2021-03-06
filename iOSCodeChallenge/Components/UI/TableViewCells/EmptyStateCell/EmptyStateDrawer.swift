//
//   EmptyStateDrawer.swift
//   iOSCodeChallenge
//
//   Creado por Borja Saez de Guinoa Vilaplana el 14/2/21.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

internal final class EmptyStateDrawer: CellDrawerProtocol {
    func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(EmptyStateCell.self, forCellReuseIdentifier: EmptyStateCell.cellIdentifier())
        return tableView.dequeueReusableCell(withIdentifier: EmptyStateCell.cellIdentifier(), for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any? = nil, at indexPath: IndexPath) {
        guard let cell = cell as? EmptyStateCell, let cellVM = item as? EmptyStateCellModel else {
            return
        }
        
        cell.setEmptyStateImage(image: cellVM.emptyState.emptyImage)
        cell.setEmptyStateDescription(text: cellVM.emptyState.description)
        
   
    }
}

