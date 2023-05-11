//
//  PreferenceKeys.swift
//  DesignCodeiOS15
//
//  Created by Alexander Sobolev on 11.5.23..
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
