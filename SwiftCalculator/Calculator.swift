//
//  Calculator.swift
//  SwiftCalculator
//
//  Created by Blazej SLEBODA on 14/06/2019.
//  Copyright © 2019 Blazej SLEBODA. All rights reserved.
//

import Foundation

public class Calculator {
    
    var nf: NumberFormatter
    
    public init() {
        nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 7
        nf.minimumFractionDigits = 0
        nf.alwaysShowsDecimalSeparator = false
        nf.roundingMode = .halfUp
        nf.usesGroupingSeparator = true
        nf.nilSymbol = "Error"
        nf.decimalSeparator = "."
        nf.groupingSeparator = " "
    }
    
    public var display: String {
        if currentComponent == .left {
            return nf.string(from: left)!
        }
        return input.string
    }
    
    private func tapDigit(digit: Button) {
        if currentComponent == .left {
            input.setToString(digit.rawValue)
        } else {
            input.append(digit.rawValue)
        }
    }
    
    public var input: Input = Input()
    
    public enum Component {
        case left, input
    }
    
    public var currentComponent = Component.input
    
    public var selectedOperation: MathematicalOperand?
    
    open var left: NSDecimalNumber = NSDecimalNumber(0)
    
    private func reset() {
        left = 0
        input.reset()
        currentComponent = .input
        selectedOperation = nil
    }
    
    public enum MathematicalOperand {
        case plus, minus, equal, multiply, divide
        
        typealias RawValue = String
        
        public init?(rawValue: String) {
            switch rawValue {
            case "+": self = .plus
            case "-": self = .minus
            case "=": self = .equal
            case "x": self = .multiply
            case "/": self = .divide
            default:
                return nil
            }
        }
        
        public var rawValue: String {
            switch self {
            case .plus: return "+"
            case .minus: return "-"
            case .equal: return "="
            case .multiply: return "x"
            case .divide: return "/"
            }
        }
    }
    
    enum Button: RawRepresentable {
        
        var rawValue: String {
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
        
        init?(rawValue: String) {
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
    
    private func calculate() {
        let decimalInput = input.decimalNumber
        
        if selectedOperation == nil {
            left = left.adding(decimalInput)
        } else if selectedOperation == .equal {
            
        } else if selectedOperation == .plus {
            left = left.adding(decimalInput)
        } else if selectedOperation == .minus {
            left = left.subtracting(decimalInput)
        } else if selectedOperation == .multiply {
            left = left.multiplying(by: decimalInput)
        } else if selectedOperation == .divide {
            let dnh = NSDecimalNumberHandler(roundingMode: .down, scale: 1, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
            //left = left.dividing(by: decimalInput, withBehavior: dnh)
            if decimalInput.doubleValue.isZero {
                left = left.dividing(by: decimalInput, withBehavior: dnh)
            } else {
                left = left.dividing(by: decimalInput)
            }
        }
    }
    
    public func tapPlus() {
        calculate()
        currentComponent = .left
        selectedOperation = .plus
    }
    
    public func tapEqual() {
        calculate()
        currentComponent = .left
        selectedOperation = .equal
    }
    
    public func tapAc() {
        reset()
    }
    
    public func tapMultiply() {
        calculate()
        currentComponent = .left
        selectedOperation = .multiply
    }
    
    public func tapDivide() {
        calculate()
        currentComponent = .left
        selectedOperation = .divide
    }
    
    public func tapMinus() {
        calculate()
        currentComponent = .left
        selectedOperation = .minus
    }
    
    public func tapDecimalSpeparator() {
        input.hasExponent = true
    }
    
    public func tapSign() {
        if currentComponent == .left {
            left = left.multiplying(by: NSDecimalNumber(integerLiteral: -1))
        } else {
            input.isNegative = !input.isNegative
        }
    }
    
    public func tapPercent() {
        guard input.decimalNumber != 0 else {
            input.setToString("0")
            return
        }
        
        if selectedOperation != nil {
            
            if selectedOperation == .some(.minus) {
                if currentComponent == .input {
                    let percent = left.multiplying(by: input.decimalNumber.dividing(by: 100))
                    input.setToString(percent.stringValue)
                }
            } else if selectedOperation == .some(.plus) {
                if currentComponent == .input {
                    let percent = left.multiplying(by: input.decimalNumber.dividing(by: 100))
                    input.setToString(percent.stringValue)
                }
            } else if selectedOperation == .some(.divide) {
                if currentComponent == .input {
                    let percent = input.decimalNumber.dividing(by: 100)
                    input.setToString(percent.stringValue)
                }
            } else if selectedOperation == .some(.multiply) {
                if currentComponent == .input {
                    let percent = input.decimalNumber.dividing(by: 100)
                    input.setToString(percent.stringValue)
                }
            }
        } else {
            let newValue = input.decimalNumber.dividing(by: 100).stringValue
            input.setToString(newValue)
        }
    }
    
    public func tapZero() {
        tapDigit(digit: .zero)
        currentComponent = .input
    }
    
    public func tapOne() {
        tapDigit(digit: .one)
        currentComponent = .input
    }
    
    public func tapTwo() {
        tapDigit(digit: .two)
        currentComponent = .input
    }
    
    public func tapThree() {
        tapDigit(digit: .three)
        currentComponent = .input
    }
    
    public func tapFour() {
        tapDigit(digit: .four)
        currentComponent = .input
    }
    
    public func tapFive() {
        tapDigit(digit: .five)
        currentComponent = .input
    }
    
    public func tapSix() {
        tapDigit(digit: .six)
        currentComponent = .input
    }
    
    public func tapSeven() {
        tapDigit(digit: .seven)
        currentComponent = .input
    }
    
    public func tapEight() {
        tapDigit(digit: .eight)
        currentComponent = .input
    }
    
    public func tapNine() {
        tapDigit(digit: .nine)
        currentComponent = .input
    }
    
    @discardableResult public func calculatorButtonWithTitleClicked(text: String) -> String {
        guard let button = Button(rawValue: text) else {
            return ""
        }
        
        switch button {
        case .plus:
            tapPlus()
        case .equal:
            tapEqual()
        case .ac:
            tapAc()
        case .sign:
            tapSign()
        case .multiply:
            tapMultiply()
        case .divide:
            tapDivide()
        case .minus:
            tapMinus()
        case .percent:
            tapPercent()
        case .decimalSeparator:
            tapDecimalSpeparator()
        case .zero:
            tapZero()
        case .one:
            tapOne()
        case .two:
            tapTwo()
        case .three:
            tapThree()
        case .four:
            tapFour()
        case .five:
            tapFive()
        case .six:
            tapSix()
        case .seven:
            tapSeven()
        case .eight:
            tapEight()
        case .nine:
            tapNine()
        }
        
        if let someSelectedOperation = selectedOperation {
            if currentComponent == .left {
                return String(format: "%@ %@", display, someSelectedOperation.rawValue)
            }
            return display
        }
        return display
    }
}
