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
        case .plusMinus, .dot, .clear, .delete, .enter:
            return .misc
        default:
            return .numeric
        }
    }

    var label: String {
        switch name {
        case .zero:
            return Strings.Button.Numeric.zero
        case .one:
            return Strings.Button.Numeric.one
        case .two:
            return Strings.Button.Numeric.two
        case .three:
            return Strings.Button.Numeric.three
        case .four:
            return Strings.Button.Numeric.four
        case .five:
            return Strings.Button.Numeric.five
        case .six:
            return Strings.Button.Numeric.six
        case .seven:
            return Strings.Button.Numeric.seven
        case .eight:
            return Strings.Button.Numeric.eight
        case .nine:
            return Strings.Button.Numeric.nine
        case .division:
            return Strings.Button.Operation.division
        case .multiplication:
            return Strings.Button.Operation.multiplication
        case .minus:
            return Strings.Button.Operation.minus
        case .plus:
            return Strings.Button.Operation.plus
        case .plusMinus:
            return Strings.Button.Misc.plusMinus
        case .dot:
            return Strings.Button.Misc.dot
        case .clear:
            return Strings.Button.Misc.clear
        case .delete:
            return Strings.Button.Misc.delete
        case .enter:
            return Strings.Button.Misc.enter
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

enum ButtonName {
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case division
    case multiplication
    case minus
    case plus
    case plusMinus
    case dot
    case clear
    case delete
    case enter
}
