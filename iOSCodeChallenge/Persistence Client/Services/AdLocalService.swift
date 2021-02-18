//
//  AdLocalService.swift
//  iOSCodeChallenge
//
//  Created by Borja Saez de Guinoa Vilaplana on 17/2/21.
//

import Foundation
import CoreData

protocol AdLocalServiceProtocol: LocalServiceProtocol{

    
    func fetchFavoriteAdList(success:@escaping([FavoriteAdDB])->(), failure: @escaping(PersistenceError)-> ())
    
    func toggleFavoriteStatus(idResultDTO: IDResultDTO, success: @escaping(_ isFavoriteAfterToggle: Bool)->(), failure: @escaping(PersistenceError)-> ())
    
    func fetchFavorite(adId: String, success: @escaping () -> (), failure: @escaping (PersistenceError) -> ())
    
}

class AdLocalService: AdLocalServiceProtocol {

    
    let equalsIdPredicate = "id == %@"
    private var binder: PersistenceBinding?

    
    
    var persistenceClient: PersistenceClientProtocol
    
    init(localClient: PersistenceClientProtocol = PersistenceClient()){
        self.persistenceClient = localClient
        self.binder = PersistenceBinding()
    }

    
    func toggleFavoriteStatus(idResultDTO: IDResultDTO, success: @escaping(_ isFavoriteAfterToggle: Bool)->(), failure: @escaping(PersistenceError)-> ()) {
        
        fetchFavorite(adId: idResultDTO.propertyCode ?? "") {
            do {
                try self.deleteFavorite(adId: idResultDTO.propertyCode ?? "")
                success(false)
            }catch{
                failure(.couldNotDeleteObject)
            }
        } failure: { (error) in
            do {
                try self.addFavorite(idResultDTO)
                success(true)
            }catch{
                failure(.couldNotSaveObject)
            }
        }
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
    
    func fetchFavorite(adId: String, success: @escaping () -> (), failure: @escaping (PersistenceError) -> ()) {
        guard let context = PersistenceStore.managedObjectContext else {
            failure(PersistenceError.managedObjectContextNotFound)
            return
        }
        let request: NSFetchRequest<FavoriteAdDB> = NSFetchRequest(entityName: String(describing: FavoriteAdDB.self))
        request.predicate = NSPredicate.init(format: equalsIdPredicate, adId)

        if (try? context.fetch(request).first) != nil {
            success()
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

        favoriteAd(idResultDTO: idResultDTO, favoriteDB: favoriteDB, context: context)
        try persistenceClient.persistDatabase(context: context)
    }
    
    // MARK: - Private Methods
    private func favoriteAd(idResultDTO: IDResultDTO, favoriteDB: NSEntityDescription, context: NSManagedObjectContext) {
        let favoriteEntity = FavoriteAdDB(entity: favoriteDB, insertInto: context)
        binder?.mapCharacter(favoriteAdDB: favoriteEntity, iDResultDTO: idResultDTO)
    }
    

    
}
