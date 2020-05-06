//
//  AppDelegate.swift
//  FavouriteThings
//
//  Created by William Dower on 19/4/20.
//  Copyright © 2020 William Dower. All rights reserved.
//

import CoreData
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // Here is the only place I could put these variables.
    // In Rene's example, he uses an isUpdating property of the model's class
    // This doesn't work in a CoreData scenario, however, as apparently all CoreData properties are @Published
    // The changing of isUpdating back to false then triggers a view update which causes the loop to start up again
    // This is a location accessible from everywhere for these variables.
    var isUpdating: Bool = false
    var isJumping: Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    /// Saves current context before app termination.
    func applicationWillTerminate(_ application: UIApplication) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("No current app delegate running")
        }
        appDelegate.saveContext()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let errorExists = error as NSError? {
                print("Failed to load/create database")
                fatalError("\(errorExists): \(errorExists.userInfo)")
            }
        }
        print("Successfully loaded from CoreData")
        return container
    }()
    
    /// Saves changes to the context to CoreData
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Changes saved to CoreData")
            }
            catch {
                let cannotSaveError = error as NSError
                print("Failed to save the changes to the context")
                fatalError("\(cannotSaveError): \(cannotSaveError.userInfo)")
            }
        }
    }
}
