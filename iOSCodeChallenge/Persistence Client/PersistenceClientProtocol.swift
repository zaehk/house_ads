//
//  PersistenceClientProtocol.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 17/2/21.
//

import Foundation
import CoreData

protocol PersistenceClientProtocol: class {
    func persistDatabase(context: NSManagedObjectContext) throws
}

protocol LocalServiceProtocol {
    var persistenceClient: PersistenceClientProtocol {get}
}
