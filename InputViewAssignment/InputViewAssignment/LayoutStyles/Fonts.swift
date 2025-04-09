//
//  Fonts.swift
//  InputViewAssignment
//
//  Created by Martin Mikula on 09/04/2025.
//

import SwiftUI

public enum CustomFonts {
    case labelS
    case labelM
    case bodyM
    
    // TODO: replace with Inter font (for example https://fonts.google.com/specimen/Inter, and add license view with font license)
    public var font: Font {
        switch self {
        case .labelS: return .system(size: 14, weight: .medium)
        case .labelM: return .system(size: 16, weight: .medium)
        case .bodyM: return .system(size: 16, weight: .regular)
        }
    }
}
