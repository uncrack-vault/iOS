//
//  SplashScreen.swift
//  UnCrack
//
//  Created by Aritra on 20/02/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive: Bool = false
        
        var body: some View {
            ZStack {
                if self.isActive {
                    NavigationStack {
                        PasswordScreen()
                    }
                } else {
                    Rectangle()
                        .background(Color.black)
                    
                    Image("uncrack-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
}

#Preview {
    SplashScreen()
}
