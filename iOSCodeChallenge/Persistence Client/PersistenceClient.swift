//
//  PersistenceClient.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 17/2/21.
//

import Foundation
import CoreData

internal final class PersistenceClient: PersistenceClientProtocol {
    
    func persistDatabase(context: NSManagedObjectContext) throws {
        do {
            try context.save()
        } catch {
            throw PersistenceError.couldNotUpdateObject
        }
    }
    
}
