//
//  PasswordInputValidation.swift
//  InputViewAssignment
//
//  Created by Martin Mikula on 09/04/2025.
//

import Foundation

enum PasswordValidationError: InputViewValidationErrorProtocol {
    case shortPassword(minNumberOfCharacters: Int)
    case atLeastOneUppercaseLetter
    case atLeastOneNumber
    case atLeastOneSpecialCharacter
    
    var errorMessage: String {
        switch self {
        case .shortPassword(let minNumberOfCharacters):
            return "Min \(minNumberOfCharacters) characters."
        case .atLeastOneUppercaseLetter:
            return "At least one uppercase letter."
        case .atLeastOneNumber:
            return "At least one number."
        case .atLeastOneSpecialCharacter:
            return "At least one special character."
        }
    }
}

struct PasswordLengthValidationRule: InputViewValidationRuleProtocol {
    func validate(_ input: String) -> InputViewValidationErrorProtocol? {
        let minNumberOfCharacters = 8
        
        guard input.count >= minNumberOfCharacters else {
            return PasswordValidationError.shortPassword(minNumberOfCharacters: minNumberOfCharacters)
        }
        return nil
    }
}

struct PasswordOneUppercaseLetterValidationRule: InputViewValidationRuleProtocol {
    func validate(_ input: String) -> InputViewValidationErrorProtocol? {
        guard input.contains(where: { $0.isUppercase }) else { return PasswordValidationError.atLeastOneUppercaseLetter }
        return nil
    }
}

struct PasswordOneNumberValidationRule: InputViewValidationRuleProtocol {
    func validate(_ input: String) -> InputViewValidationErrorProtocol? {
        guard input.contains(where: { $0.isNumber }) else { return PasswordValidationError.atLeastOneNumber }
        return nil
    }
}

struct PasswordOneSpecialCharacterValidationRule: InputViewValidationRuleProtocol {
    func validate(_ input: String) -> InputViewValidationErrorProtocol? {
        guard input.rangeOfCharacter(from: CharacterSet(charactersIn: "?=#/%")) != nil else { return PasswordValidationError.atLeastOneSpecialCharacter }
        return nil
    }
}
