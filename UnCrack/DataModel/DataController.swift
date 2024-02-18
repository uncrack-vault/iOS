//
//  DataController.swift
//  UnCrack
//
//  Created by Aritra on 18/02/24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "PasswordModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data is saved!")
        } catch {
            print("We could not save your data")
        }
    }
    
    func addPassword(name: String, email: String, username: String, password: String, context: NSManagedObjectContext) {
        let account = Password(context: context)
        account.id = UUID()
        account.date = Date()
        account.name = name
        account.email = email
        account.username = username
        account.password = password
        
        save(context: context)
    }
    
    func editPassword(account: Password, name: String, email: String, username: String, password: String, context: NSManagedObjectContext) {
        account.date = Date()
        account.name = name
        account.email = email
        account.username = username
        account.password = password
        
        save(context: context)
    }
}
