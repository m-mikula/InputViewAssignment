//
//  BaseStyles.swift
//  InputViewAssignment
//
//  Created by Martin Mikula on 09/04/2025.
//

import SwiftUI

// MARK: - Font styles

private struct FontModifier: ViewModifier {
    let style: TitleStyleProtocol
    let state: InputViewState
    
    func body(content: Content) -> some View {
        content
            .font(style.font.font)
            .foregroundStyle(style.getTextColor(for: state))
    }
}

public extension View {
    func applyInputViewTitleFontStyle(_ style: TitleStyleProtocol, for state: InputViewState) -> some View {
        modifier(FontModifier(style: style, state: state))
    }
}

// MARK: - Text field styles

private struct TextFieldModifier: ViewModifier {
    let style: TextFieldStyleProtocol
    let state: InputViewState
    
    func body(content: Content) -> some View {
        content
            .frame(minHeight: style.minHeight)
            .padding(style.padding)
            .keyboardType(style.keyboardType)
            .disableAutocorrection(true)
            .overlay(
                RoundedRectangle(cornerRadius: style.cornerRadius)
                    .stroke(style.getStrokeColor(for: state), lineWidth: style.strokeLineWidth)
            )
    }
}

public extension View {
    func applyInputViewTextFieldStyle(_ style: TextFieldStyleProtocol, for state: InputViewState) -> some View {
        modifier(TextFieldModifier(style: style, state: state))
    }
}
