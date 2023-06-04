//
//  Suggestion.swift
//  DesignCodeiOS15
//
//  Created by Alexander Sobolev on 4.6.23..
//

import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "Flutter"),
    Suggestion(text: "Design"),
    Suggestion(text: "React")
]
