//
//  InputViewModel.swift
//  InputViewAssignment
//
//  Created by Martin Mikula on 09/04/2025.
//

import SwiftUI

// MARK: - Required input validator

enum InputViewValidationError: InputViewValidationErrorProtocol {
    case requiredInput
    
    var errorMessage: String {
        switch self {
        case .requiredInput:
            return "Required"
        }
    }
}

public struct RequiredInputValidationRule: InputViewValidationRuleProtocol {
    public func validate(_ input: String) -> InputViewValidationErrorProtocol? {
        input.isEmpty ? InputViewValidationError.requiredInput : nil
    }
}

// MARK: - Protocols, enums

public enum InputViewType {
    case normal
    case secureText
}

public enum InputViewState {
    case ok
    case error
}

public protocol InputViewValidationErrorProtocol: Error {
    var errorMessage: String { get }
}

public protocol InputViewValidationRuleProtocol {
    func validate(_ input: String) -> InputViewValidationErrorProtocol?
}

public protocol InputViewModelProtocol: Observable {
    var text: String { get set }
    var firstTitle: String? { get }
    var secondTitle: String? { get }
    var placeholder: String { get }
    var validationRules: [InputViewValidationRuleProtocol] { get }
    var inputViewType: InputViewType { get }
    var isValidating: Bool { get set }
    
    var state: InputViewState { get }
    var validationErrorMessages: String { get }
    var showTitles: Bool { get }
    var firstTitleText: String? { get }
}

// MARK: - Base implementation

@Observable public final class InputViewModel: InputViewModelProtocol {
    public var text: String
    
    public let firstTitle: String?
    public let secondTitle: String?
    public let placeholder: String
    public let validationRules: [InputViewValidationRuleProtocol]
    public let inputViewType: InputViewType
    public var isValidating: Bool = false
    
    public var state: InputViewState {
        guard isValidating else { return .ok }
        return validationErrorMessages.isEmpty ? .ok : .error
    }
    
    public var validationErrorMessages: String {
        validationRules
            .compactMap { rule in
                rule.validate(text)?.errorMessage
            }
            .joined(separator: "\n")
    }
    
    public var showTitles: Bool {
        let firstTitle = firstTitle ?? ""
        let secondTitle = secondTitle ?? ""
        
        return !validationErrorMessages.isEmpty || !firstTitle.isEmpty || !secondTitle.isEmpty
    }
    
    public var firstTitleText: String? {
        let errorMessages = validationErrorMessages
        
        if !errorMessages.isEmpty && isValidating && state == .error {
            return errorMessages
        } else if let firstTitle = firstTitle, !firstTitle.isEmpty {
            return firstTitle
        }
        return nil
    }
    
    public init(
        text: String? = nil,
        firstTitle: String? = nil,
        secondTitle: String? = nil,
        placeholder: String,
        validationRules: [InputViewValidationRuleProtocol] = [],
        inputViewType: InputViewType = .normal
    ) {
        self.text = text ?? ""
        self.firstTitle = firstTitle
        self.secondTitle = secondTitle
        self.placeholder = placeholder
        self.validationRules = validationRules
        self.inputViewType = inputViewType
    }
}
