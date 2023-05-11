//
//  NavigationBar.swift
//  DesignCodeiOS15
//
//  Created by Alexander Sobolev on 11.5.23..
//

import SwiftUI

struct NavigationBar: View {
    @Binding var hasScrolled: Bool
    var title = ""
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            
            Text(title)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasScrolled ? 4 : 0)
            
            HStack(spacing: 16) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 17, weight: .bold))
                    .frame(width: 36, height: 36)
                    .foregroundColor(.secondary)
                    .background(.ultraThinMaterial, in:
                     RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
                
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in:
                     RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: hasScrolled ? 4 : 0)
        }
        .frame(height: hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(hasScrolled: .constant(true), title: "Featured")
    }
}
