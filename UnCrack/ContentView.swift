//
//  ContentView.swift
//  UnCrack
//
//  Created by Aritra on 18/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PasswordScreen()
                .tabItem {
                    Image(systemName: "lock")
                    Text("Passwords")
                }
            
            CardScreen()
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Cards")
                }
            
            GeneratePasswordScreen()
                .tabItem {
                    Image(systemName: "shield.lefthalf.filled.badge.checkmark")
                    Text("Generate Passwords")
                }
            
            SettingScreen()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Setting")
                }
        }
    }
}

#Preview {
    ContentView()
}
