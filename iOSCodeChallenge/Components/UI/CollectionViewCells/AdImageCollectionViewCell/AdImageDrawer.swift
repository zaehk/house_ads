//
//   AdImageDrawer.swift
//   iOSCodeChallenge
//
//   Creado por Borja Saez de Guinoa Vilaplana el 14/2/21.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

internal final class AdImageDrawer: CollectionDrawerProtocol {
    
    func dequeueCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(AdImageCollectionCell.self, forCellWithReuseIdentifier: AdImageCollectionCell.getCollectionIdentifier())
        return collectionView.dequeueReusableCell(withReuseIdentifier: AdImageCollectionCell.getCollectionIdentifier(),
            for: indexPath)
    }
    
    func drawCollectionCell(_ collectionView: UICollectionViewCell, withItem item: Any) {
        guard let cell = collectionView as? AdImageCollectionCell, let cellVM = item as? AdImageCollectionCellModel
        else {
            return
        }
        
        cell.setImageUrl(url: cellVM.imageUrl)
    }
}
