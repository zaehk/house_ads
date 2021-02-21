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
    var expectedBehaviourFromFavoriteAdList: ExpectedMockResponse
    
    var checkIfIsFavoriteNumberOfTimesCalled = 0
    
    func fetchFavoriteAdList(success: @escaping ([IDResultDTO]) -> (), failure: @escaping (PersistenceError) -> ()) {
        fetchFavoriteAdListCalled = true
        
        switch expectedBehaviourFromFavoriteAdList {
        
        case .error:
            failure(.objectNotFound)
        case .emptyBodyArray:
            let result : IDResultsDTO = JSONMockDecoder.decode(mock: "idResultListEmpty")
            success(result.elementList)
        case .success:
            let result : IDResultsDTO = JSONMockDecoder.decode(mock: "idResultList")
            success(result.elementList)
        }
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
    
    init(expectedResultCheckIfIsFavorite: Bool, expectedFromFavoriteAdList : ExpectedMockResponse
){
        persistenceClient = PersistenceClientMock()
        expectedBehaviourCheckIfFavorite = expectedResultCheckIfIsFavorite
        expectedBehaviourFromFavoriteAdList = expectedFromFavoriteAdList
    }
    
    
}
