//
//  AdLocalService.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 17/2/21.
//

import Foundation
import CoreData

enum LocalFavoriteOperationResult {
    case addedToFavorites(idResult: FavoriteAdDB)
    case removedFromFavorites
}

protocol AdLocalServiceProtocol: LocalServiceProtocol{

    
    func fetchFavoriteAdList(success:@escaping([FavoriteAdDB])->(), failure: @escaping(PersistenceError)-> ())
    
    func toggleFavoriteStatus(success: @escaping(LocalFavoriteOperationResult)->(), failure: @escaping(PersistenceError)-> ())
    
}

class AdLocalService: AdLocalServiceProtocol {

    
    let equalsIdPredicate = "id == %@"
    private var binder: PersistenceBinding?

    
    
    var persistenceClient: PersistenceClientProtocol
    
    init(localClient: PersistenceClientProtocol = PersistenceClient()){
        self.persistenceClient = localClient
    }

    
    func toggleFavoriteStatus(success: @escaping(LocalFavoriteOperationResult)->(), failure: @escaping(PersistenceError)-> ()) {
        
    }
    
    
    // MARK: - Fetch All
    func fetchFavoriteAdList(success: @escaping ([FavoriteAdDB]) -> (), failure: @escaping (PersistenceError) -> ()) {
        PersistenceStore.persistentStoreContainer?.performBackgroundTask({ context in
            let favoriteAdsRequest: NSFetchRequest<FavoriteAdDB> = NSFetchRequest(entityName: String(describing: FavoriteAdDB.self))

            do {
                let favoriteAdElements = try context.fetch(favoriteAdsRequest)
                success(favoriteAdElements)
            } catch {
                failure(PersistenceError.objectNotFound)
            }
         })
    }
    
    // MARK: - Fetch by Id
    
    private func fetchFavorite(adId: String, success: @escaping (FavoriteAdDB) -> (), failure: @escaping (PersistenceError) -> ()) throws {
        guard let context = PersistenceStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        let request: NSFetchRequest<FavoriteAdDB> = NSFetchRequest(entityName: String(describing: FavoriteAdDB.self))
        request.predicate = NSPredicate.init(format: equalsIdPredicate, adId)

        if let favorite = try? context.fetch(request).first {
            success(favorite)
        }else{
            failure(PersistenceError.objectNotFound)
        }
    }

    
    // MARK: - Delete
    private func deleteFavorite(adId: String) throws {
        guard let context = PersistenceStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }

        let request: NSFetchRequest<FavoriteAdDB> = NSFetchRequest(entityName: String(describing: FavoriteAdDB.self))
        request.predicate = NSPredicate.init(format: equalsIdPredicate, adId)

        if let favorite = try? context.fetch(request).first {
            let managedObject = favorite as NSManagedObject
            context.delete(managedObject)
        }

        try self.persistenceClient.persistDatabase(context: context)
    }
    
    // MARK: - Add
    private func addFavorite(_ idResultDTO: IDResultDTO) throws {
        guard let context = PersistenceStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        guard let favoriteDB = NSEntityDescription.entity(forEntityName: String(describing: FavoriteAdDB.self), in: context) else {
            throw PersistenceError.objectNotFound
        }

        likeCharacter(idResultDTO: idResultDTO, favoriteDB: favoriteDB, context: context)
        try persistenceClient.persistDatabase(context: context)
    }
    
    // MARK: - Private Methods
    private func likeCharacter(idResultDTO: IDResultDTO, favoriteDB: NSEntityDescription, context: NSManagedObjectContext) {
        let favoriteEntity = FavoriteAdDB(entity: favoriteDB, insertInto: context)
        binder?.mapCharacter(favoriteAdDB: favoriteEntity, iDResultDTO: idResultDTO)
    }
    

    
}
