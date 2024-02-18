//
//  PasswordScreen.swift
//  UnCrack
//
//  Created by Aritra on 18/02/24.
//

import SwiftUI

struct PasswordScreen: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)])
    var password: FetchedResults<Password>
    @State private var showAddView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(password) { password in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(password.name!)
                                .bold()
                            
                            Text(password.email!)
                                .foregroundStyle(Color.gray)
                        }
                    }
                    .onDelete(perform: deletePassword)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Passwords")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddView.toggle()
                    } label: {
                        Label("Add Password", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showAddView) {
                AddPasswordScreen()
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private func deletePassword(offsets: IndexSet) {
        
    }
}

#Preview {
    PasswordScreen()
}
