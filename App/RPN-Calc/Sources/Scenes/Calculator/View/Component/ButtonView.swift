//
//  ButtonView.swift
//  RPN-Calc
//
//  Created by Vinícius Couto on 13/10/21.
//

import SwiftUI

struct ButtonView: View {
    let button: CalculatorButton

    var body: some View {
        Button {
        } label: {
            Text(button.label.rawValue)
                .font(.largeTitle)
                .fontWeight(.medium)
        }
        .frame(width: button.style == .small ? LayoutMetrics.smallButtonWidth : LayoutMetrics.largeButtonWidth,
               height: LayoutMetrics.smallButtonHeight)
        .padding()
        .foregroundColor(.white)
        .background(button.type  == .numeric ? .black : button.type == .operation ? .orange : .gray)
        .cornerRadius(LayoutMetrics.smallButtonWidth)

    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let smallButtonWidth: CGFloat = 30
        static let smallButtonHeight: CGFloat = smallButtonWidth
        static let largeButtonWidth: CGFloat = 2 * smallButtonWidth
    }
}

// MARK: - Preview

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(button: .init(style: .small, type: .operation, label: .one))
    }
}
