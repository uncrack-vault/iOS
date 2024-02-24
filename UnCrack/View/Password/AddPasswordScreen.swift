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
        
        VStack(alignment: .center, spacing: 20.0) {
            
            
            
            VStack(alignment: .leading, spacing: 16.0) {
                
                Text("Account Name")
                    .font(.system(size: 16, weight: .medium))
                
                TextField("Instagram", text: $name)
                    .textFieldStyle(UCTextField())
                    .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
            }
            
            VStack(alignment: .leading, spacing: 16.0) {
                
                Text("Email")
                    .font(.system(size: 16, weight: .medium))
                
                TextField("johndoe12@gmail.com", text: $email)
                    .textFieldStyle(UCTextField())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }
            
            VStack(alignment: .leading, spacing: 16.0) {
                
                Text("Username")
                    .font(.system(size: 16, weight: .medium))
                
                TextField("john doe", text: $username)
                    .textFieldStyle(UCTextField())
                    .keyboardType(.default)
            }
            
            VStack(alignment: .leading, spacing: 16.0) {
                
                Text("Password")
                    .font(.system(size: 16, weight: .medium))
                
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
            }
            
            VStack(alignment: .leading, spacing: 16.0) {
                
                Text("Notes")
                    .font(.system(size: 16, weight: .medium))
                
                TextField("", text: $note)
                    .textFieldStyle(UCTextField())
                    .keyboardType(.default)
            }
            
            
            
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
        .navigationTitle("Add Password")
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    AddPasswordScreen()
}
