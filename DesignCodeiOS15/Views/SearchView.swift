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
    @State var selectedIndex  = 0
    @State var showCourse     = false
    @State var text           = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    content
                }
                .padding(20)
                .background(.ultraThinMaterial, in:
                 RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .offset(y: -200)
                        .blur(radius: 20)
                )
                .background(
                Image("Blob 1")
                    .offset(x: -100, y: -200)
                )
            }
            .searchable(
            text: $text,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "SwiftUI, React UI Design") {
                ForEach(suggestions) { suggestion in
                    Button {
                        text = suggestion.text
                    } label: {
                        Text(suggestion.text)
                            .searchCompletion(suggestion.text)
                    }
                }
            }
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
            .sheet(isPresented: $showCourse) {
                CourseView(show: $showCourse, course: courses[selectedIndex], namespace: namespace)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

extension SearchView {
    private var content: some View {
        ForEach(Array(courses.enumerated()), id: \.offset) { index, item in
            if item.title.contains(text) || text == "" {
                if index != 0 { Divider() }
                Button {
                    showCourse = true
                    selectedIndex = index
                } label: {
                    HStack(alignment: .top, spacing: 12) {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .background(Color("Background"))
                            .mask(Circle())
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title)
                                .bold()
                                .foregroundColor(.primary)
                            Text(item.text)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding(.vertical, 4)
                    .listRowSeparator(.hidden)
                }
            }
        }
    }
}
