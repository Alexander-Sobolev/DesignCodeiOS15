//
//  ContentView.swift
//  DesignCodeiOS15
//
//  Created by Alexander Sobolev on 4.5.23..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
            Text("SwiftUI for iOS 15")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(/*@START_MENU_TOKEN@*/"20 sections - 3 hours"/*@END_MENU_TOKEN@*/)
                .font(.footnote)
                .fontWeight(.semibold)
            Text(/*@START_MENU_TOKEN@*/"Build an iOS app for iOS 15 with custom layouts, animations and ..."/*@END_MENU_TOKEN@*/)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
        .frame(height: 350.0)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Background")/*@END_MENU_TOKEN@*/)
        .cornerRadius(/*@START_MENU_TOKEN@*/30.0/*@END_MENU_TOKEN@*/)
        .shadow(radius: /*@START_MENU_TOKEN@*/20/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
