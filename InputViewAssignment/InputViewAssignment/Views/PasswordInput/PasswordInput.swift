//
//  PasswordInput.swift
//  InputViewAssignment
//
//  Created by Martin Mikula on 09/04/2025.
//

import SwiftUI

struct PasswordInput: View {
    @State private var viewModel = InputViewModel(
        firstTitle: "Fill password",
        placeholder: "Password",
        validationRules: [
            PasswordLengthValidationRule(),
            PasswordOneUppercaseLetterValidationRule(),
            PasswordOneNumberValidationRule(),
            PasswordOneSpecialCharacterValidationRule()
        ],
        inputViewType: .secureText
    )
    
    private let style = InputViewStyle(
        baseDimensions: InputViewStyle.BaseDimensions(
            verticalSpacing: Dimensions.Spacing.xs,
            titlesSpacing: Dimensions.Spacing.xs,
            padding: EdgeInsets(
                top: Dimensions.Padding.xs,
                leading: Dimensions.Padding.m,
                bottom: Dimensions.Padding.xs,
                trailing: Dimensions.Padding.m
            ),
            backgroundColor: CustomColors.Surface.xLow
        ),
        firstTitleStyle: InputViewStyle.FirstTitleStyle(font: .labelM),
        secondTitleStyle: InputViewStyle.SecondTitleStyle(font: .labelS),
        textFieldStyle: InputViewStyle.TextFieldStyle(
            minHeight: Dimensions.Spacing.fiveXL,
            padding: EdgeInsets(top: 0, leading: Dimensions.Padding.m, bottom: 0, trailing: Dimensions.Padding.m),
            keyboardType: .asciiCapable,
            cornerRadius: Dimensions.Radius.input,
            strokeLineWidth: Dimensions.Stroke.l,
            placeholderFont: .bodyM,
            placeholderTextColor: CustomColors.Content.OnNeutral.low
        )
    )
    
    var body: some View {
        InputView(viewModel: viewModel, style: style)
            .onSubmit {
                viewModel.isValidating = true
            }
    }
}

#Preview {
    PasswordInput()
}
