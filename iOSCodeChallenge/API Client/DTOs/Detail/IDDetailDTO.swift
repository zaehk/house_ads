//
//  IDDetailDTO.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 15/2/21.
//

import Foundation

struct IDDetailDTO: Codable {
    let adid: String?
    let price: Int?
    let extendedPropertyType, operation, propertyComment: String?
    let multimedia: IDResultMultimediaDTO?
}
