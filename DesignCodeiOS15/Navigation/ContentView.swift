//
//  ContentView.swift
//  DesignCodeiOS15
//
//  Created by Alexander Sobolev on 4.5.23..
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: Model
    @AppStorage("selTab") var selectedTab: Tab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
                switch selectedTab {
                case .home:
                    HomeView()
                case .explore:
                    AccountView()
                case .notifications:
                    AccountView()
                case .library:
                    AccountView()
                }
            
            TabBar()
                .offset(y: model.showDetail ? 200 : 0)
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(Model())
    }
}
