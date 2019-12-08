//
//  DefaultKeyboardTests.swift
//  SwiftCalculatorTests
//
//  Created by Blazej SLEBODA on 07/12/2019.
//  Copyright © 2019 Blazej SLEBODA. All rights reserved.
//

import XCTest

class DefaultKeyboardTests: XCTestCase {
    
    func testDefaultKeyboardInit() {
        XCTAssertNotNil(DefaultCalculatorKeyboard(calculator: Calculator()))
    }
    
    func testKeyboardTapAllKeys() {
        let keyboard = DefaultCalculatorKeyboard(calculator: Calculator())
        keyboard
            .tap(.plus)
            .tap(.minus)
            .tap(.equal)
            .tap(.ac)
            .tap(.sign)
            .tap(.multiply)
            .tap(.divide)
            .tap(.percent)
            .tap(.decimalSeparator)
            .tap(.zero)
            .tap(.one)
            .tap(.two)
            .tap(.three)
            .tap(.four)
            .tap(.five)
            .tap(.six)
            .tap(.seven)
            .tap(.eight)
            .tap(.nine)
    }
    
    func testButtonInit() {
        XCTAssertEqual(KeyboardButton(rawValue: "+"), .plus)
        XCTAssertEqual(KeyboardButton(rawValue: "-"), .minus)
        XCTAssertEqual(KeyboardButton(rawValue: "="), .equal)
        XCTAssertEqual(KeyboardButton(rawValue: "ac"), .ac)
        XCTAssertEqual(KeyboardButton(rawValue: "+/-"), .sign)
        XCTAssertEqual(KeyboardButton(rawValue: "x"), .multiply)
        XCTAssertEqual(KeyboardButton(rawValue: "/"), .divide)
        XCTAssertEqual(KeyboardButton(rawValue: "%"), .percent)
        XCTAssertEqual(KeyboardButton(rawValue: "."), .decimalSeparator)
        XCTAssertEqual(KeyboardButton(rawValue: "0"), .zero)
        XCTAssertEqual(KeyboardButton(rawValue: "1"), .one)
        XCTAssertEqual(KeyboardButton(rawValue: "2"), .two)
        XCTAssertEqual(KeyboardButton(rawValue: "3"), .three)
        XCTAssertEqual(KeyboardButton(rawValue: "4"), .four)
        XCTAssertEqual(KeyboardButton(rawValue: "5"), .five)
        XCTAssertEqual(KeyboardButton(rawValue: "6"), .six)
        XCTAssertEqual(KeyboardButton(rawValue: "7"), .seven)
        XCTAssertEqual(KeyboardButton(rawValue: "8"), .eight)
        XCTAssertEqual(KeyboardButton(rawValue: "9"), .nine)
        XCTAssertEqual(KeyboardButton(rawValue: ""), nil)
    }
    
    func testButtonRawValue() {
        XCTAssertEqual(KeyboardButton.plus.rawValue, "+")
        XCTAssertEqual(KeyboardButton.minus.rawValue, "-")
        XCTAssertEqual(KeyboardButton.equal.rawValue, "=")
        XCTAssertEqual(KeyboardButton.ac.rawValue, "ac")
        XCTAssertEqual(KeyboardButton.sign.rawValue, "+/-")
        XCTAssertEqual(KeyboardButton.multiply.rawValue, "x")
        XCTAssertEqual(KeyboardButton.divide.rawValue, "/")
        XCTAssertEqual(KeyboardButton.percent.rawValue, "%")
        XCTAssertEqual(KeyboardButton.decimalSeparator.rawValue, ".")
        XCTAssertEqual(KeyboardButton.zero.rawValue, "0")
        XCTAssertEqual(KeyboardButton.one.rawValue, "1")
        XCTAssertEqual(KeyboardButton.two.rawValue, "2")
        XCTAssertEqual(KeyboardButton.three.rawValue, "3")
        XCTAssertEqual(KeyboardButton.four.rawValue, "4")
        XCTAssertEqual(KeyboardButton.five.rawValue, "5")
        XCTAssertEqual(KeyboardButton.six.rawValue, "6")
        XCTAssertEqual(KeyboardButton.seven.rawValue, "7")
        XCTAssertEqual(KeyboardButton.eight.rawValue, "8")
        XCTAssertEqual(KeyboardButton.nine.rawValue, "9")
    }
}
