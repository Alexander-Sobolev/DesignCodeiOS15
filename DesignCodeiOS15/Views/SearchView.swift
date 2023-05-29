//
//  SearchView.swift
//  DesignCodeiOS15
//
//  Created by Alexander Sobolev on 29.5.23..
//

import SwiftUI

struct SearchView: View {
    @Namespace var namespace
    @State var selectedCourse = courses[0]
    @State var showCourse     = false
    @State var text           = ""
    
    var body: some View {
        NavigationView {
            List(0..<5) { item in
                Text("Hello")
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: "SwiftUI, React UI Design")
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

