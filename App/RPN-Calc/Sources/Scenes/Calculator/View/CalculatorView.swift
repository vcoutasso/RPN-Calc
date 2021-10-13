//
//  CalculatorView.swift
//  RPN-Calc
//
//  Created by Vinícius Couto on 13/10/21.
//

import SwiftUI

struct CalculatorView: View {

    private static let buttonNames: [[ButtonName]] = [
        [.enter, .plutsMinus, .delete],
        [.seven, .eight, .nine, .division],
        [.four, .five, .six, .multiplication],
        [.one, .two, .three, .minus],
        [.clear, .zero, .dot, .plus]
    ]

    let buttons: [[CalculatorButton]] = buttonNames.map { $0.map { .init(name: $0) } }

    @ObservedObject var engine: Engine = .init()

    var body: some View {
        ZStack {
            backgroundView

            VStack(spacing: LayoutMetrics.spacing / 4) {
                Spacer()

                rpnStackView

                buttonsView
            }.padding([.leading, .trailing])
        }
    }

    // MARK: - Private views

    private var backgroundView: some View {
        Color.black
            .ignoresSafeArea()
    }

    private var rpnStackView: some View {
        VStack {
            HStack {
                Spacer()

                Text(engine.yRegister.displayValue)
                    .font(.largeTitle)
                    .foregroundColor(.white)

            }.padding()

            HStack {
                Spacer()

                Text(engine.xRegister.displayValue)
                    .font(.largeTitle)
                    .foregroundColor(.white)

            }.padding()
        }
    }

    private var buttonsView: some View {
        ForEach(self.buttons, id: \.self) { row in
            HStack(spacing: LayoutMetrics.spacing) {
                ForEach(row, id: \.self) { button in
                    ButtonView(engine: engine, button: button)
                }
            }
        }.padding(.bottom)
    }

    // MARK: - Layout Metrics

    private enum LayoutMetrics {
        static let spacing: CGFloat = 16
    }
}

// MARK: - Preview

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
