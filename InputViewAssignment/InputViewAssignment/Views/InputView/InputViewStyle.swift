//
//  InputViewStyle.swift
//  InputViewAssignment
//
//  Created by Martin Mikula on 09/04/2025.
//

import SwiftUI

// MARK: - Protocols, typealiases

public protocol BaseDimensionsProtocol {
    var verticalSpacing: CGFloat { get }
    var titlesSpacing: CGFloat { get }
    var padding: EdgeInsets { get }
    var backgroundColor: Color { get }
}

public protocol TitleStyleProtocol {
    var font: CustomFonts { get }
    
    func getTextColor(for state: InputViewState) -> Color
}

public protocol TextFieldStyleProtocol {
    var minHeight: CGFloat { get }
    var padding: EdgeInsets { get }
    var keyboardType: UIKeyboardType { get }
    var cornerRadius: CGFloat { get }
    var strokeLineWidth: CGFloat { get }
    var placeholderFont: CustomFonts { get }
    var placeholderTextColor: Color { get }
    
    func getStrokeColor(for state: InputViewState) -> Color
}

public protocol InputViewStyleProtocol {
    var baseDimensions: BaseDimensionsProtocol { get }
    var firstTitleStyle: TitleStyleProtocol { get }
    var secondTitleStyle: TitleStyleProtocol { get }
    var textFieldStyle: TextFieldStyleProtocol { get }
}

// MARK: - Base implementation

public struct InputViewStyle: InputViewStyleProtocol {
    public let baseDimensions: BaseDimensionsProtocol
    public let firstTitleStyle: TitleStyleProtocol
    public let secondTitleStyle: TitleStyleProtocol
    public let textFieldStyle: TextFieldStyleProtocol
}

extension InputViewStyle {
    public struct BaseDimensions: BaseDimensionsProtocol {
        public let verticalSpacing: CGFloat
        public let titlesSpacing: CGFloat
        public let padding: EdgeInsets
        public let backgroundColor: Color
    }
    
    public struct FirstTitleStyle: TitleStyleProtocol {
        public let font: CustomFonts
        
        public func getTextColor(for state: InputViewState) -> Color {
            switch state {
            case .ok:
                return CustomColors.Content.OnNeutral.xxHigh
            case .error:
                return CustomColors.Content.OnNeutral.danger
            }
        }
    }
    
    public struct SecondTitleStyle: TitleStyleProtocol {
        public let font: CustomFonts
        
        public func getTextColor(for state: InputViewState) -> Color {
            CustomColors.Content.OnNeutral.low
        }
    }
    
    public struct TextFieldStyle: TextFieldStyleProtocol {
        public let minHeight: CGFloat
        public let padding: EdgeInsets
        public let keyboardType: UIKeyboardType
        public let cornerRadius: CGFloat
        public let strokeLineWidth: CGFloat
        public let placeholderFont: CustomFonts
        public let placeholderTextColor: Color
        
        public func getStrokeColor(for state: InputViewState) -> Color {
            switch state {
            case .ok:
                return CustomColors.Surface.xHigh
            case .error:
                return CustomColors.Surface.danger
            }
        }
    }
}
