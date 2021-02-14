//
//  CollectionViewCellProtocols.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 14/2/21.
//

import UIKit

protocol GetCollectionIdentifierProtocol {
    static func getCollectionIdentifier() -> String
}

extension GetCollectionIdentifierProtocol where Self: UICollectionViewCell {
    static func getCollectionIdentifier() -> String {
        return String(describing: self)
    }
}

internal protocol CollectionDrawerProtocol {
    
    func dequeueCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    
    func drawCollectionCell(_ collectionView: UICollectionViewCell, withItem item: Any)
}

internal protocol CollectionDrawerItemProtocol {
    
    var collectionDrawer: CollectionDrawerProtocol { get }
}
