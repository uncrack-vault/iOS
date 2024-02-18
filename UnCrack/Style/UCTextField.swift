//
//  UCTextField.swift
//  UnCrack
//
//  Created by Aritra on 18/02/24.
//

import Foundation
import SwiftUI

struct UCTextField: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color(red: 0.89, green: 0.941, blue: 0.98), lineWidth: 2)
            }
            .background(Color(red: 0.96, green: 0.98, blue: 0.99))
    }
}
