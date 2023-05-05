//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Alexander Sobolev on 5.5.23..
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    Text("Settings")
                        .listRowSeparatorTint(.blue)
                    .listRowSeparator(.hidden)
                }
                Text("Billing")
                Text("Money")
            }
            .listStyle(.sidebar)
            .navigationTitle("Account")
        }
    }
}
  
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
