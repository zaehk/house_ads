//
//   AdDrawer.swift
//   iOSCodeChallenge
//
//   Creado por Borja Saez de Guinoa Vilaplana el 13/2/21.

import UIKit

internal final class AdCellDrawer: CellDrawerProtocol {
    
    //Dequeue and register
    
    func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(AdTableViewCell.self, forCellReuseIdentifier: AdTableViewCell.cellIdentifier())
        return tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.cellIdentifier(), for: indexPath)
    }
    
    //Draw logic
    
    func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any? = nil, at indexPath: IndexPath) {
        guard let cell = cell as? AdTableViewCell, let cellVM = item as? AdCellModel, let delegate = delegate as? AdTableViewCellFavoriteProtocol else {
            return
        }
        
        cell.setFavoriteStatus(isFavorite: cellVM.isFavorite)
        cell.setPrice(price: cellVM.price)
        cell.setRealStateDescription(adDescription: cellVM.description)
        cell.setImages(imagesURL: cellVM.imagesURL)
        cell.setDelegate(delegate: delegate)
        cell.setCellIndex(index: indexPath.row)
    }
}

