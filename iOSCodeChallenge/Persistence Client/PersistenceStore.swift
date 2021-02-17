//
//  PersistenceStore.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 17/2/21.
//

import UIKit
import CoreData

internal final class PersistenceStore {
    
    static var persistentStoreContainer: NSPersistentContainer? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.persistentContainer
        }
        return nil
    }
    
    static var persistentStoreCoordinator: NSPersistentStoreCoordinator? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.persistentContainer?.persistentStoreCoordinator
        }
        return nil
    }
    
    static var managedObjectModel: NSManagedObjectModel? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.persistentContainer?.managedObjectModel
        }
        return nil
    }
    
    static var managedObjectContext: NSManagedObjectContext? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate.persistentContainer?.viewContext
        }
        return nil
    }
}
