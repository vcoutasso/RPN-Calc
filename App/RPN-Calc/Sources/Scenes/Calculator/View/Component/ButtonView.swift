//
//  ButtonView.swift
//  RPN-Calc
//
//  Created by Vinícius Couto on 13/10/21.
//

import SwiftUI

struct ButtonView: View {

    let engine: Engine
    let button: CalculatorButton

    var body: some View {
        Button {
            engine.getInput(from: button)
        } label: {
            Text(button.label)
                .font(.largeTitle)
//                .font(.system(size: LayoutMetrics.buttonFontSize))
                .fontWeight(.medium)
                .frame(width: buttonWidth(), height: (UIScreen.main.bounds.width - 5*12)/4, alignment: .center)
                .foregroundColor(.white)
                .background(backgroundColor())
                .cornerRadius(buttonWidth())
        }
    }

    // MARK: - Private functions

    private func backgroundColor() -> Color {
        button.type  == .numeric ? Color(UIColor.darkGray) : button.type == .operation ? .orange : .gray
    }

    private func buttonWidth() -> CGFloat {
        button.style == .large ? (UIScreen.main.bounds.width - 4*12)/4*2 + 4 : (UIScreen.main.bounds.width - 5*12)/4
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let buttonFontSize: CGFloat = 32
    }
}

// MARK: - Preview

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(engine: Engine(), button: .init(name: .one))
    }
}
