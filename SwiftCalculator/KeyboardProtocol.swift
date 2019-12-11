//
//  KeyboardProtocol.swift
//  SwiftCalculator
//
//  Created by Blazej SLEBODA on 07/12/2019.
//  Copyright © 2019 Blazej SLEBODA. All rights reserved.
//

import Foundation

public protocol KeyboardProtocol {
    var calculator: Calculator? { get set }
    @discardableResult
    func tap(_ button: KeyboardButton) -> KeyboardProtocol
    @discardableResult
    func tapButtonWithTitle(_ text: String) -> String
}

class DefaultCalculatorKeyboard: KeyboardProtocol {
    var calculator: Calculator?
    
    public init() {
    }
    
    @discardableResult
    public func tap(_ button: KeyboardButton) -> KeyboardProtocol {
        guard let calculator = calculator else { return self }
        
        switch button {
        case .ac: calculator.tapAc()
        case .decimalSeparator: calculator.tapDecimalSpeparator()
        case .divide: calculator.tapDivide()
        case .zero: calculator.tapZero()
        case .one: calculator.tapOne()
        case .two: calculator.tapTwo()
        case .three: calculator.tapThree()
        case .four: calculator.tapFour()
        case .five: calculator.tapFive()
        case .six: calculator.tapSix()
        case .seven: calculator.tapSeven()
        case .eight: calculator.tapEight()
        case .nine: calculator.tapNine()
        case .minus: calculator.tapMinus()
        case .plus: calculator.tapPlus()
        case .multiply: calculator.tapMultiply()
        case .sign: calculator.tapSign()
        case .percent: calculator.tapPercent()
        case .equal: calculator.tapEqual()
        }
        return self
    }
    
    @discardableResult
    public func tapButtonWithTitle(_ text: String) -> String {
        guard let calculator = calculator else { return "" }
        guard let button = KeyboardButton(rawValue: text) else {
            return ""
        }
        
        switch button {
        case .plus:
            calculator.tapPlus()
        case .equal:
            calculator.tapEqual()
        case .ac:
            calculator.tapAc()
        case .sign:
            calculator.tapSign()
        case .multiply:
            calculator.tapMultiply()
        case .divide:
            calculator.tapDivide()
        case .minus:
            calculator.tapMinus()
        case .percent:
            calculator.tapPercent()
        case .decimalSeparator:
            calculator.tapDecimalSpeparator()
        case .zero:
            calculator.tapZero()
        case .one:
            calculator.tapOne()
        case .two:
            calculator.tapTwo()
        case .three:
            calculator.tapThree()
        case .four:
            calculator.tapFour()
        case .five:
            calculator.tapFive()
        case .six:
            calculator.tapSix()
        case .seven:
            calculator.tapSeven()
        case .eight:
            calculator.tapEight()
        case .nine:
            calculator.tapNine()
        }
        
        if let someSelectedOperation = calculator.selectedOperation {
            if calculator.currentComponent == .left {
                return String(format: "%@ %@", calculator.display, someSelectedOperation.rawValue)
            }
            return calculator.display
        }
        return calculator.display
    }

}

public enum KeyboardButton: String {
    
    public var rawValue: String {
        switch self {
        case .plus: return "+"
        case .minus: return "-"
        case .equal: return "="
        case .ac: return "ac"
        case .sign: return "+/-"
        case .multiply: return "x"
        case .divide: return "/"
        case .percent: return "%"
        case .decimalSeparator: return "."
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        }
    }
    
    case plus, minus, equal, ac, sign, multiply, divide, percent, decimalSeparator
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    public init?(rawValue: String) {
        switch rawValue {
        case "+": self = .plus
        case "-": self = .minus
        case "=": self = .equal
        case "ac": self = .ac
        case "+/-": self = .sign
        case "x": self = .multiply
        case "/": self = .divide
        case "%": self = .percent
        case ".": self = .decimalSeparator
        case "0": self = .zero
        case "1": self = .one
        case "2": self = .two
        case "3": self = .three
        case "4": self = .four
        case "5": self = .five
        case "6": self = .six
        case "7": self = .seven
        case "8": self = .eight
        case "9": self = .nine
        default:
            return nil
        }
    }
            
}
