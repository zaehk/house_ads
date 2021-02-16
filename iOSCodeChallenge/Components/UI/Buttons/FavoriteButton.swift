//
//  FavoriteButton.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 16/2/21.
//

import UIKit

class FavoriteButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)!
         self.commonInit()

     }

     override init(frame: CGRect) {
         super.init(frame: frame)
         self.commonInit()
     }
    
     func commonInit(){
         backgroundColor = .white
         layer.borderWidth = 2
         layer.borderColor = Styles.Colors.idealistaPurple.cgColor
         layer.cornerRadius = 15
         clipsToBounds = true
         imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
     }
    
    func isFavorite(favorite: Bool){
        self.setImage(favorite ? UIImage.init(named: "filled_favorite") : UIImage.init(named: "blank_favorite"), for: .normal)
        tintColor = .red
    }
    
}
