//
//  UCButton.swift
//  UnCrack
//
//  Created by Aritra on 18/02/24.
//

import Foundation
import SwiftUI

struct UCButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .padding([.leading, .trailing], 20)
    }
}
