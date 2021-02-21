//
//  MockFileConstants.swift
//  iOSCodeChallengeTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 21/2/21.
//

import Foundation

protocol MockFileConstant {
    var errorOrEmpty: String { get }
    var success: String { get }
}

enum MockFile: MockFileConstant {
    
    case adList
    case adDetail

    
    
    var errorOrEmpty: String {
        switch self{
        
        case .adList:
            return "idResultListEmpty"
        case .adDetail:
            return ""
        }
    }
    
    var success: String {
        switch self{
            
        case .adList:
            return "idResultList"
        case .adDetail:
            return "idResultDTO"
        }
    }
    
}
