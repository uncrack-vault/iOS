//
//  UnCrackApp.swift
//  UnCrack
//
//  Created by Aritra on 18/02/24.
//

import SwiftUI

@main
struct UnCrackApp: App {
    @StateObject private var dataController =  DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
