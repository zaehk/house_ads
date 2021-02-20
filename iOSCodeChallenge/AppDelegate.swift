import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabbarController = MainTabbarController()
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        return true
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer? = {
        let container = NSPersistentContainer(name: "iOSCodeChallenge")
        var persistentStoreError: NSError?
        container.loadPersistentStores(completionHandler: { storeDescription, error in
            if let error = error as NSError? {
                    persistentStoreError = error
            }
        })
        return persistentStoreError == nil ? container : nil
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        if let context = persistentContainer?.viewContext,
            context.hasChanges {
                try? context.save()
        }
    }
    
    
}

