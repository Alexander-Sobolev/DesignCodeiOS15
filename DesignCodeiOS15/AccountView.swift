//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Alexander Sobolev on 5.5.23..
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    var body: some View {
        NavigationView {
            List {
                VStack(spacing: 8) {
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                        .symbolVariant(.circle.fill)
                        .font(.system(size: 32))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.blue, .blue.opacity(0.3))
                        .padding()
                        .background(Circle().fill(.ultraThinMaterial))
                        .background(
                            Image(systemName: "hexagon")
                                .symbolVariant(.fill)
                                .foregroundColor(.blue)
                                .font(.system(size: 200))
                                .offset(x: -50, y: -100)
                    )
                    Text("SOBOLEV")
                        .font(.title.weight(.semibold))
                        .foregroundStyle(.linearGradient(colors: [.blue, .blue.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    HStack {
                        Image(systemName: "location")
                            .imageScale(.small)
                            .foregroundColor(.blue)
                        Text("Canada")
                            .foregroundStyle(.linearGradient(colors: [.blue, .blue.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    }
                }
                .frame(maxWidth: .infinity)
                Section {
                    NavigationLink(destination: ContentView()) {
                        Label("Settings", systemImage: "gear")
                    }
                    NavigationLink {
                        ContentView()
                    } label: {
                        Label("Billing", systemImage: "creditcard")
                    }
                    NavigationLink {
                        ContentView()
                    } label: {
                        Label("Money", systemImage: "questionmark")
                    }
                }
                .foregroundColor(.primary)
                .listRowSeparatorTint(.blue)
                .listRowSeparator(.hidden)
                
                Section {
                    if !isDeleted {
                        Link(destination: URL(string: "https://apple.com")!) {
                            HStack {
                                Label("Website", systemImage: "house")
                                Spacer()
                                Image(systemName: "link")
                                    .foregroundColor(.secondary)
                            }
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button {
                                isDeleted = true
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                            Button {
                                //
                            } label: {
                                Label("Pin", systemImage: "pin")
                            }
                            .tint(.yellow)


                        }
                    }
                    Link(destination: URL(string: "https://youtube.com")!) {
                        HStack {
                            Label("YouTube", systemImage: "tv")
                            Spacer()
                            Image(systemName: "link")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .foregroundColor(.primary)
                .listRowSeparator(.hidden)
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
