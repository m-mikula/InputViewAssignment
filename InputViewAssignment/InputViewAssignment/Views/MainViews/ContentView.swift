//
//  ContentView.swift
//  InputViewAssignment
//
//  Created by Martin Mikula on 09/04/2025.
//

import SwiftUI

public enum TextFieldType: String, Hashable {
    case username, email, password
}

struct ContentView: View {
    @FocusState private var focusedTextField: TextFieldType?
    
    var body: some View {
        ScrollView {
            VStack {
                ExampleInputView(viewModel: InputViewModel(
                    firstTitle: "Username",
                    secondTitle: "Optional",
                    placeholder: "e.g. nick name"
                ))
                    .focused($focusedTextField, equals: .username)
                    .onSubmit {
                        focusedTextField = .email
                    }
                ExampleInputView(viewModel: InputViewModel(
                    firstTitle: "Email address",
                    placeholder: "example@example.com",
                    validationRules: [RequiredInputValidationRule()]
                ))
                    .focused($focusedTextField, equals: .email)
                    .onSubmit {
                        focusedTextField = .password
                    }
                PasswordInput()
                    .focused($focusedTextField, equals: .password)
            }
        }
    }
}

#Preview {
    ContentView()
}
