//
//  ButtonStyling.swift
//  dexcomMacDisplay
//
//  Created by Hannah Adams on 2/15/24.
//

import SwiftUI

// Styling with border and clear background
struct MenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .foregroundColor(.black)
            .background(configuration.isPressed ? Color.gray.opacity(0.5) : Color.clear)
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 2))
    }
}

// Styling with less inner padding, lighter icon
struct ClearButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(2)
            .foregroundColor(.gray)
            .background(configuration.isPressed ? Color.gray.opacity(0.5) : Color.clear)
        .cornerRadius(8)
    }
}
