//
//  InputView.swift
//  InputViewAssignment
//
//  Created by Martin Mikula on 09/04/2025.
//

import SwiftUI

public struct InputView: View {
    @State private var viewModel: InputViewModelProtocol
    private let style: InputViewStyleProtocol
    
    public var body: some View {
        VStack(spacing: style.baseDimensions.verticalSpacing) {
            if viewModel.showTitles {
                HStack(spacing: style.baseDimensions.titlesSpacing) {
                    if let firstTitleText = viewModel.firstTitleText {
                        Text(firstTitleText)
                            .applyInputViewTitleFontStyle(style.firstTitleStyle, for: viewModel.state)
                    }
                    
                    if let secondTitle = viewModel.secondTitle, !secondTitle.isEmpty {
                        Text(secondTitle)
                            .applyInputViewTitleFontStyle(style.secondTitleStyle, for: viewModel.state)
                    }
                    
                    Spacer()
                }
            }
            
            textField
                .applyInputViewTextFieldStyle(style.textFieldStyle, for: viewModel.state)
                .onChange(of: viewModel.text) { _, newValue in
                    viewModel.isValidating = !newValue.isEmpty
                }
                
        }
        .padding(style.baseDimensions.padding)
        .background(style.baseDimensions.backgroundColor)
    }
    
    @ViewBuilder private var textField: some View {
        switch viewModel.inputViewType {
        case .normal:
            TextField("", text: $viewModel.text, prompt: textFieldPlaceholder)
        case .secureText:
            SecureField(viewModel.placeholder, text: $viewModel.text)
        }
    }
    
    private var textFieldPlaceholder: Text {
        Text(viewModel.placeholder)
            .font(style.textFieldStyle.placeholderFont.font)
            .foregroundStyle(style.textFieldStyle.placeholderTextColor)
    }
    
    public init(viewModel: InputViewModelProtocol, style: InputViewStyleProtocol) {
        self.viewModel = viewModel
        self.style = style
    }
}

// MARK: -  Example implementation of InputView

struct ExampleInputView: View {
    @State var viewModel: InputViewModelProtocol
    
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
    ExampleInputView(viewModel: InputViewModel(
        firstTitle: "Email address",
        secondTitle: "Optional",
        placeholder: "example@example.com"
    ))
}
