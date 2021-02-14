//
//  IDEnums.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.
//

import UIKit


//Enum defining each of the possible property options with its description localized

enum Property: String {
    case flat = "flat"
    case studio = "studio"
    case penthouse = "penthouse"
    case duplex = "duplex"
    case chalet = "chalet"
    
    var description: String {
        switch self {
        
        case .flat:
            return Literals.RealStateType.flat
        case .studio:
            return Literals.RealStateType.studio
        case .penthouse:
            return Literals.RealStateType.penthouse
        case .duplex:
            return Literals.RealStateType.duplex
        case .chalet:
            return Literals.RealStateType.chalet
        }
    }
}

//Enum defining each of the possible transaction tipologies with its description localized

enum TransactionTipology: String {
    case rent = "rent"
    case sale = "sale"
    
    var description: String {
        switch self {
        
        case .rent:
            return Literals.Transactions.forRent
        case .sale:
            return Literals.Transactions.onSale
        }
    }
}

//Enum defining all possible empty states for tableviews used in the app

enum EmptyState {
    case adList
    case favorites
    
    var description: String{
        switch self{

        case .adList:
            return Literals.EmptyState.adList
        case .favorites:
            return Literals.EmptyState.favorites
        }
    }
    
    var emptyImage: UIImage? {
        switch self{

        case .adList:
            return UIImage.init(named: "adList_empty")
        case .favorites:
            return UIImage.init(named: "favorites_empty")
        }
    }
}
