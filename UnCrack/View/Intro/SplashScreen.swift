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
                PasswordScreen()
            } else {
                Rectangle()
                    .background(Color.white)
                
                Image("uncrack")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240)
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
