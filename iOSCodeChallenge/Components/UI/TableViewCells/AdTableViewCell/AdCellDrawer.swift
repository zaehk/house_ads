//
//   AdDrawer.swift
//   iOSCodeChallenge
//
//   Creado por Borja Saez de Guinoa Vilaplana el 13/2/21.

import UIKit

internal final class AdCellDrawer: CellDrawerProtocol {
    
    //Dequeue and register
    
    func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: AdTableViewCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: AdTableViewCell.cellIdentifier())
        
        return tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.cellIdentifier(), for: indexPath)
    }
    
    //Draw logic
    
    func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any? = nil, at indexPath: IndexPath? = nil) {
        guard let cell = cell as? AdTableViewCell, let cellVM = item as? AdCellModel else {
            return
        }
        
        //example
       // cell.setTitleLabelText(text: cellVM.title)
   
    }
}
