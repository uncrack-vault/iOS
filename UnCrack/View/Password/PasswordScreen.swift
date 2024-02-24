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
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(password) { password in
                        NavigationLink(destination: EditPasswordScreen(account: password)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(password.name!)
                                        .bold()
                                    
                                    Text(password.email!)
                                        .foregroundStyle(Color.gray)
                                }
                            }
                        }
                    }
                    .onDelete(perform: deletePassword)
                }
                .navigationTitle("Passwords")
                .listStyle(.plain)
                
                NavigationLink(destination: AddPasswordScreen(), label: {
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 4, x: 0, y: 4)

                })
                .padding()
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private func deletePassword(offsets: IndexSet) {
        withAnimation {
            offsets.map {password[$0]}.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
    }
}

#Preview {
    PasswordScreen()
}
