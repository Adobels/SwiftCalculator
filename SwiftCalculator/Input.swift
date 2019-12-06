//
//  Input.swift
//  SwiftCalculator
//
//  Created by Blazej SLEBODA on 14/06/2019.
//  Copyright © 2019 Blazej SLEBODA. All rights reserved.
//

import Foundation

public class Input {
    
    var mantisa: String = "0"
    var hasExponent: Bool = false
    var exponent: String = ""
    var isNegative: Bool = false
    var nf: NumberFormatter
    
    init() {
        nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 7
        nf.minimumFractionDigits = 0
        nf.alwaysShowsDecimalSeparator = false
        nf.roundingMode = .halfUp
        nf.usesGroupingSeparator = true
        nf.nilSymbol = "Error"
        nf.decimalSeparator = characterDot
        nf.groupingSeparator = " "
    }
    
    func append(_ character: String) {
        if hasExponent {
            exponent.append(character)
        } else {
            if mantisa == "0" {
                mantisa = character
            } else {
                mantisa.append(character)
            }
        }
    }
    let characterDot = "."
    public var string: String {
        var str: String
        
        let dNumber: NSDecimalNumber
        
        if hasExponent {
            dNumber = NSDecimalNumber(mantissa: UInt64([mantisa, exponent].joined()) ?? 0, exponent: Int16(exponent.count) * -1, isNegative: false)
        } else {
            dNumber = NSDecimalNumber(mantissa: UInt64(mantisa) ?? 0, exponent: 0, isNegative: false)
        }
        
        str = nf.string(from: dNumber)!
        if hasExponent {
            
            if exponent.count == 0 {
                str.append(characterDot)
            } else {
                if Int16(exponent) == 0 {
                    str.append(characterDot)
                    str.append(exponent)
                }
            }
            
        }
        if isNegative {
            str.insert("-", at: str.startIndex)
        }
        return str
    }
    
    public var decimalNumber: NSDecimalNumber {
        var dNumber: NSDecimalNumber
        
        if hasExponent {
            dNumber = NSDecimalNumber(mantissa: UInt64([mantisa, exponent].joined()) ?? 0, exponent: Int16(exponent.count) * -1, isNegative: false)
        } else {
            dNumber = NSDecimalNumber(mantissa: UInt64(mantisa) ?? 0, exponent: 0, isNegative: false)
        }
        
        if isNegative {
            dNumber = dNumber.multiplying(by: -1)
        }
        return dNumber
    }
    
    func setToString(_ string: String) {
        reset()
        for item in string.enumerated() {
            if item.element == "-" {
                isNegative = true
            } else if String(item.element) == characterDot {
                hasExponent = true
            } else {
                append(String(item.element))
            }
        }
    }
    
    func reset() {
        mantisa = "0"
        hasExponent = false
        isNegative = false
        exponent = ""
    }
    
}
