//
//  IDEnums.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.
//

import UIKit


//Enum defining each of the possible property options with its description localized

enum Property {
    case flat
    case studio
    case penthouse
    case duplex
    case chalet
    
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

enum TransactionTipology {
    case rent
    case sale
    
    var description: String {
        switch self {
        
        case .rent:
            return Literals.Transactions.forRent
        case .sale:
            return Literals.Transactions.onSale
        }
    }
}
