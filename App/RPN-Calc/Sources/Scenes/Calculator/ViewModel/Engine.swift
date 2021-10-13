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
            handleNumberPressed(number: button.name.rawValue)
        case .operation:
            handleOperationPressed(operation: button.name.rawValue)
        case .misc:
            if button.name == .enter {
                handleEnterPressed()
            } else if button.name == .delete {
                handleDeletePressed()
            } else if button.name == .clear {
                handleClearPressed()
            } else if button.name == .dot {
                handleDotPressed()
            } else if button.name == .plutsMinus {
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
            case "−":
                let result = yValue - xValue
                xRegister.setValue(newValue: String(result))
            case "+":
                let result = yValue + xValue
                xRegister.setValue(newValue: String(result))
            case "÷":
                let result = yValue / xValue
                xRegister.setValue(newValue: String(result))
            case "✕":
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
        if !xRegister.displayValue.contains(".") {
            xRegister.appendDigit(newDigit: ".")
        }
    }

    // MARK: - Register

    struct Register: Identifiable, Hashable {
        static let defaultValue: String = "0"

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
