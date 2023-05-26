//
//  DesignCodeiOS15App.swift
//  DesignCodeiOS15
//
//  Created by Alexander Sobolev on 4.5.23..
//

import SwiftUI

@main
struct DesignCodeiOS15App: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
