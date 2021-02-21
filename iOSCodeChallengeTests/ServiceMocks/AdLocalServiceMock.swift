//
//  AdLocalServiceMock.swift
//  iOSCodeChallengeTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/2/21.
//

@testable import iOSCodeChallenge
import XCTest

class AdLocalServiceMock: AdLocalServiceProtocol {
    
    var fetchFavoriteAdListCalled = false
    var toggleFavoriteStatusCalled = false
    var checkIfIsFavoriteCalled = false
    
    var expectedBehaviourCheckIfFavorite = false
    
    var checkIfIsFavoriteNumberOfTimesCalled = 0
    
    func fetchFavoriteAdList(success: @escaping ([IDResultDTO]) -> (), failure: @escaping (PersistenceError) -> ()) {
        fetchFavoriteAdListCalled = true
    }
    
    func toggleFavoriteStatus(idResultDTO: IDResultDTO, success: @escaping (Bool) -> (), failure: @escaping (PersistenceError) -> ()) {
        toggleFavoriteStatusCalled = true
    }
    
    func checkIfIsFavorite(adId: String, success: @escaping () -> (), failure: @escaping (PersistenceError) -> ()) {
        checkIfIsFavoriteCalled = true
        checkIfIsFavoriteNumberOfTimesCalled += 1
        expectedBehaviourCheckIfFavorite ? success() : failure(.objectNotFound)
    }
    
    var persistenceClient: PersistenceClientProtocol
    
    init(expectedResultCheckIfIsFavorite: Bool){
        persistenceClient = PersistenceClientMock()
        expectedBehaviourCheckIfFavorite = expectedResultCheckIfIsFavorite
    }
    
    
}
