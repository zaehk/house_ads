//
//  TableViewCellProtocols.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.
//

import UIKit

protocol GetCellIdentifierProtocol {
    static func cellIdentifier() -> String
}

extension GetCellIdentifierProtocol where Self: UITableViewCell {
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}

internal protocol CellDrawerProtocol {
    func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any?, at indexPath: IndexPath)
}

internal protocol DrawerItemProtocol {
    var cellDrawer: CellDrawerProtocol { get }
}
