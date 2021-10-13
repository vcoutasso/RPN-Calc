//
//  CalculatorButton.swift
//  RPN-Calc
//
//  Created by Vinícius Couto on 13/10/21.
//

import Foundation

struct CalculatorButton: Identifiable, Hashable {
    var id: UUID = .init()
    let name: ButtonName

    var style: ButtonStyle {
        switch self.name {
        case .enter:
            return .large
        default:
            return .small
        }
    }

    var type: ButtonType {
        switch self.name {
        case .division, .multiplication, .minus, .plus:
            return .operation
        case .plutsMinus, .dot, .clear, .delete, .enter:
            return .misc
        default:
            return .numeric
        }
    }
}

enum ButtonStyle {
    case small
    case large
}

enum ButtonType {
    case numeric
    case operation
    case misc
}

enum ButtonName: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case division = "÷"
    case multiplication = "✕"
    case minus = "−"
    case plus = "+"
    case plutsMinus = "+/-"
    case dot = "."
    case clear = "C"
    case delete = "←"
    case enter = "ENTER"

}
