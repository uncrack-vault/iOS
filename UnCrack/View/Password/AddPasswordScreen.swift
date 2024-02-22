//
//  AddEditPasswordScreen.swift
//  UnCrack
//
//  Created by Aritra on 18/02/24.
//

import SwiftUI

struct AddPasswordScreen: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var note: String = ""
    @State private var isShowingPassword: Bool = false
    @State private var passwordIcon: String = "eye"
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            VStack(spacing: 30) {
                
                TextField("Instagram", text: $name)
                    .textFieldStyle(UCTextField())
                    .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                
                TextField("johndoe12@gmail.com", text: $email)
                    .textFieldStyle(UCTextField())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                TextField("john doe", text: $username)
                    .textFieldStyle(UCTextField())
                    .keyboardType(.default)
                
                ZStack {
                    Group {
                        if isShowingPassword {
                            TextField("*******", text: $password)
                                .textFieldStyle(UCTextField())
                        }else {
                            SecureField("*******", text: $password)
                                .textFieldStyle(UCTextField())
                        }
                    }
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    
                    Image(systemName: passwordIcon)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    .padding()
                    .foregroundColor(Color(red: 0.549, green: 0.576, blue: 0.6))
                    .onTapGesture {
                        isShowingPassword.toggle()
                        if isShowingPassword {
                            passwordIcon = "eye.slash"
                        } else {
                            passwordIcon = "eye"
                        }
                    }
                }
                
                TextField("Note", text: $note)
                    .textFieldStyle(UCTextField())
                    .keyboardType(.default)
                
                Spacer()
                
                Button(action: {
                    DataController().addPassword(name: name, email: email, username: username, password: password, note: note, context: managedObjContext)
                    
                    dismiss()
                }) {
                    
                    Text("Save")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
                .buttonStyle(UCButton())
            }
            .padding()
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    AddPasswordScreen()
}
