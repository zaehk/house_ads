//
//  PersistenceError.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 17/2/21.
//

import Foundation

internal enum PersistenceError: LocalizedError {

    case managedObjectContextNotFound
    case persistenceStoreNotFound
    case couldNotSaveObject
    case couldNotDeleteObject
    case couldNotUpdateObject
    case objectNotFound
    
    public var errorDescription: String {
        switch self {
        case .managedObjectContextNotFound:
            return ""
        case .persistenceStoreNotFound:
            return ""
        case .couldNotSaveObject:
            return ""
        case .couldNotDeleteObject:
            return ""
        case .couldNotUpdateObject:
            return ""
        case .objectNotFound:
            return ""
        }
    }
}

