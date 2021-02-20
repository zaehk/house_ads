//
//  PurpleRoundedContainer.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 16/2/21.
//

import UIKit

class PurpleRoundedContainer: UIView {
    
    required init(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)!
         self.commonInit()

     }

     override init(frame: CGRect) {
         super.init(frame: frame)
         self.commonInit()
     }
    
     func commonInit(){
        backgroundColor = Styles.Colors.idealistaPurple.withAlphaComponent(0.1)
        layer.borderWidth = 3
        layer.borderColor = Styles.Colors.idealistaPurple.cgColor
        layer.cornerRadius = 10
        clipsToBounds = true
     }

}
