//
//  PersistenceClientMock.swift
//  iOSCodeChallengeTests
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/2/21.
//

@testable import iOSCodeChallenge
import XCTest
import CoreData

class PersistenceClientMock: PersistenceClientProtocol {
    
    var persistDatabaseCalled = false
    
    func persistDatabase(context: NSManagedObjectContext) throws {
        persistDatabaseCalled = true
    }
    
}

