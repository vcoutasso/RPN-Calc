//
//  CalculatorButton.swift
//  RPN-Calc
//
//  Created by Vinícius Couto on 13/10/21.
//

struct CalculatorButton {
    let style: ButtonStyle
    let type: ButtonType
    let label: ButtonLabel
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

enum ButtonLabel: String {
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
    case minus = "-"
    case plus = "+"
    case plutsMinus = "+/-"
    case dot = "."
    case clear = "C"
    case delete = "<-" // TODO: Find better symbol
    case enter = "ENTER"

}
