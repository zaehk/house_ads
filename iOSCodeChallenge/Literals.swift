//
//  Literals.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 13/2/21.
//

import Foundation

struct Literals {
    
    struct AdList {
        static let title = "tabbar_item_adList".localized()
    }
    
    struct AdDetail {
        static let title = "".localized()
    }
    
    struct Favorites {
        static let title = "tabbar_item_favorites".localized()

    }
    
    struct Transactions {
        static let onSale = "on_sale_tipology".localized()
        static let forRent = "rent_tipology".localized()
    }
    
    struct RealStateType {
        static let flat = "house_type_flat".localized()
        static let studio = "house_type_studio".localized()
        static let penthouse = "house_type_penthouse".localized()
        static let duplex = "house_type_duplex".localized()
        static let chalet = "house_type_chalet".localized()
    }
    
    struct Common {
        static let refreshControlDescription = "refresh_description".localized()
        static let priceMonth = "price_month".localized()
    }
    
    struct EmptyState{
        static let favorites = "empty_state_favorites".localized()
        static let adList = "empty_state_adList".localized()
    }
    
}
