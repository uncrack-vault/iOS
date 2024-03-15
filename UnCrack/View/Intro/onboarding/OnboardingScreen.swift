//
//  OnboardingScreen.swift
//  UnCrack
//
//  Created by Aritra on 16/03/24.
//

import SwiftUI
import Lottie

struct OnboardingScreen: View {
    
    @State private var currentPage: Int = 0
    @State private var gotoLoginScreen: Bool = false
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .trailing) {
                
                
                Text("Skip").onTapGesture {
                    gotoLoginScreen = true
                    Storage.shared.isTutorialRead = true
                }
                
                ZStack(alignment: .bottomTrailing) {
                    TabView(selection: $currentPage) {
                        ForEach(0..<items.count, id: \.self) { index in
                            let item = items[index]
                            GeometryReader { g in
                                VStack(alignment: .center) {
                                    LottieView(name: "page_\(index)", loopMode: .loop)
                                        .frame(maxHeight: 300)
                                        .padding(.vertical, 10)
                                    VStack(spacing: 16) {
                                        Text(item.screenTitle)
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("On-Primary-Container"))
                                        Text(item.screenDescription)
                                            .font(.headline)
                                            .foregroundColor(Color("On-Surface-60"))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.medium)
                                    }
                                    Spacer()
                                }
                                .opacity(Double(g.frame(in: .global).minX) / 200 + 1)
                            }
                            .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    
                    Button(action: {
                        if isLastScreen {
                            gotoLoginScreen = true
                            Storage.shared.isTutorialRead = true
                        } else {
                            currentPage += 1
                        }
                    }) {
                        Text(isLastScreen ? "Login" : "Next")
                            .font(.headline)
                            .frame(width: 100, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color("On-Primary-Container"))
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.all)
            .navigationDestination(isPresented: $gotoLoginScreen) {
                LoginScreen()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
    
    var isLastScreen: Bool {
        currentPage == items.count - 1
    }
}

#Preview {
    OnboardingScreen()
}
