//
//  PriceLabel.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 16/2/21.
//

import UIKit

class PriceLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)!
         self.commonInit()

     }

     override init(frame: CGRect) {
         super.init(frame: frame)
         self.commonInit()
     }
    
     func commonInit(){
        font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        textColor = Styles.Colors.idealistaPurple
        numberOfLines = 1
        textAlignment = .left
     }

}

