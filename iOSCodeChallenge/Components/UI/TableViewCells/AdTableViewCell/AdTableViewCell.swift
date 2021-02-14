//
//   AdCell.swift
//   iOSCodeChallenge
//
//   Creado por Borja Saez de Guinoa Vilaplana el 13/2/21.

import UIKit

class AdTableViewCell: UITableViewCell, GetCellIdentifierProtocol {
    
    // MARK: - IBOutlets -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    // MARK: - Internal Methods -
    
//    func setTitleLabelText(text: String) {
//        titleLabel.text = text
//    }
    
}
