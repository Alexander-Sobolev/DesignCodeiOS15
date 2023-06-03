//
//  SearchView.swift
//  DesignCodeiOS15
//
//  Created by Alexander Sobolev on 29.5.23..
//

import SwiftUI

struct SearchView: View {
    @Environment(\.dismiss) private var dismiss
    @Namespace var namespace
    @State var selectedCourse = courses[0]
    @State var showCourse     = false
    @State var text           = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(courses.filter { $0.title.contains(text) || text == "" }) { item in
                    Text(item.title)
                }
            }
            .searchable(
            text: $text,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "SwiftUI, React UI Design"
            )
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                        .bold()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

