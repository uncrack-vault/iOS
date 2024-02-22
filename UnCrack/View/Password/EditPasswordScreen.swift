//
//  EditPasswordScreen.swift
//  UnCrack
//
//  Created by Aritra on 19/02/24.
//

import SwiftUI

struct EditPasswordScreen: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var account: FetchedResults<Password>.Element
    
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
                
                
                TextField("\(account.name!)", text: $name)
                    .textFieldStyle(UCTextField())
                    .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                
                TextField("\(account.email!)", text: $email)
                    .textFieldStyle(UCTextField())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                TextField("\(account.username!)", text: $username)
                    .textFieldStyle(UCTextField())
                    .keyboardType(.default)
                
                ZStack {
                    Group {
                        if isShowingPassword {
                            TextField("\(account.password!)", text: $password)
                                .textFieldStyle(UCTextField())
                        }else {
                            SecureField("\(account.password!)", text: $password)
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
                
                TextField("\(account.note!)", text: $note)
                    .textFieldStyle(UCTextField())
                    .keyboardType(.default)
                
                Spacer()
                
                Button(action: {
                    DataController().editPassword(account: account, name: name, email: email, username: username, password: password, note: note, context: managedObjContext)
                    
                    dismiss()
                }) {
                    
                    Text("Submit")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
                .buttonStyle(UCButton())
            }
            .padding()
            .navigationTitle("Edit Password")
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

