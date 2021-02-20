//
//  PersistenceBinding.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 17/2/21.
//

import Foundation
import CoreData

internal final class PersistenceBinding {
    
    func mapFavorite(favoriteAdDB: FavoriteAdDB, iDResultDTO: IDResultDTO) {
        
        favoriteAdDB.detailUrl = iDResultDTO.detailUrl
        favoriteAdDB.id = iDResultDTO.propertyCode
        favoriteAdDB.images = iDResultDTO.multimedia?.images.map({ $0.url ?? ""})
        favoriteAdDB.price = Int16(iDResultDTO.price ?? 0)
        favoriteAdDB.thumbnail = iDResultDTO.thumbnail
        favoriteAdDB.propertyType = iDResultDTO.propertyType
        favoriteAdDB.transaction = iDResultDTO.operation
        
    }
    
    func mapIDResults(favoritesAdDB: [FavoriteAdDB]) -> [IDResultDTO] {
        
        favoritesAdDB.map { (favoriteAdDB) -> IDResultDTO in
            
            let idResult = IDResultDTO.init(id: favoriteAdDB.id,
                                            thumbnail: favoriteAdDB.thumbnail,
                                            price: Int(favoriteAdDB.price),
                                            propertyType: favoriteAdDB.propertyType,
                                            operation: favoriteAdDB.transaction,
                                            multimedia: favoriteAdDB.images ?? [],
                                            detailURL: favoriteAdDB.detailUrl)
            return idResult
        }
    }
    
}
