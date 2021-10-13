//
//  Engine.swift
//  RPN-Calc
//
//  Created by Vinícius Couto on 13/10/21.
//

import SwiftUI

class Engine: ObservableObject {
    @Published var xRegister: Register = .init()
    @Published var yRegister: Register = .init()

    private(set) lazy var registers: [Register] = [yRegister, xRegister]

    func getInput(from button: CalculatorButton) {
        switch button.type {
        case .numeric:
            handleNumberPressed(number: button.label)
        case .operation:
            handleOperationPressed(operation: button.label)
        case .misc:
            if button.name == .enter {
                handleEnterPressed()
            } else if button.name == .delete {
                handleDeletePressed()
            } else if button.name == .clear {
                handleClearPressed()
            } else if button.name == .dot {
                handleDotPressed()
            } else if button.name == .plusMinus {
                handlePlusMinusPressed()
            }
        }
    }

    func handleEnterPressed() {
        yRegister.displayValue = xRegister.displayValue
        xRegister.reset()
    }

    func handleDeletePressed() {
        xRegister.reset()
    }

    func handleClearPressed() {
        yRegister.reset()
        xRegister.reset()
    }

    func handleNumberPressed(number: String) {
        if xRegister.isZero() || xRegister.numericValue == nil || !xRegister.numericValue!.isFinite {
            xRegister.setValue(newValue: number)
        } else {
            xRegister.appendDigit(newDigit: number)
        }
    }

    func handleOperationPressed(operation: String) {
        if let yValue = yRegister.numericValue, let xValue = xRegister.numericValue {
            switch operation {
            case Strings.Button.Operation.minus:
                let result = yValue - xValue
                xRegister.setValue(newValue: String(result))
            case Strings.Button.Operation.plus:
                let result = yValue + xValue
                xRegister.setValue(newValue: String(result))
            case Strings.Button.Operation.division:
                let result = yValue / xValue
                xRegister.setValue(newValue: String(result))
            case Strings.Button.Operation.multiplication:
                let result = yValue * xValue
                xRegister.setValue(newValue: String(result))
            default:
                return
            }

            yRegister.reset()
        }
    }

    func handlePlusMinusPressed() {
        if let xValue = xRegister.numericValue {
            xRegister.setValue(newValue: String(-xValue))
        }
    }

    func handleDotPressed() {
        if !xRegister.displayValue.contains(Strings.Button.Misc.dot) {
            xRegister.appendDigit(newDigit: Strings.Button.Misc.dot)
        }
    }

    // MARK: - Register

    struct Register: Identifiable, Hashable {
        static let defaultValue: String = Strings.Button.Numeric.zero

        var id: UUID = .init()
        fileprivate(set) var displayValue: String = defaultValue

        var numericValue: Float? {
            Float(displayValue)
        }

        mutating func reset() {
            displayValue = Register.defaultValue
        }

        func isZero() -> Bool {
            displayValue == Register.defaultValue
        }

        mutating func setValue(newValue: String) {
            displayValue = newValue
        }

        mutating func appendDigit(newDigit: String) {
            displayValue.append(newDigit)
        }
    }
}
