//
//  AdLocalServiceMock.swift
//  iOSCodeChallengeTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/2/21.
//

@testable import iOSCodeChallenge
import XCTest

class AdLocalServiceMock: AdLocalServiceProtocol {
    
    func fetchFavoriteAdList(success: @escaping ([IDResultDTO]) -> (), failure: @escaping (PersistenceError) -> ()) {
        
    }
    
    func toggleFavoriteStatus(idResultDTO: IDResultDTO, success: @escaping (Bool) -> (), failure: @escaping (PersistenceError) -> ()) {
        
    }
    
    func checkIfIsFavorite(adId: String, success: @escaping () -> (), failure: @escaping (PersistenceError) -> ()) {
        
    }
    
    var persistenceClient: PersistenceClientProtocol
    
    init(){
        persistenceClient = PersistenceClientMock()
    }
    
    
}
