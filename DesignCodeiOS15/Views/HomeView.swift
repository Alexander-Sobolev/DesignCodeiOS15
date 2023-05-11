//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by Alexander Sobolev on 11.5.23..
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            GeometryReader { proxy in
//                Text("\(proxy.frame(in: .named("scroll")).minY)")
                Color.clear.preference(
                    key: ScrollPreferenceKey.self,
                    value: proxy.frame(in: .named("scroll")).minY
                )
            }
            .frame(height: 0)
            FeaturedItem()
            Color.clear.frame(height: 1000)
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
            NavigationBar(hasScrolled: $hasScrolled, title: "Featured")
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
