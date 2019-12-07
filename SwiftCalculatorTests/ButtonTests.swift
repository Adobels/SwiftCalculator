//
//  ButtonTests.swift
//  SwiftCalculatorTests
//
//  Created by Blazej SLEBODA on 07/12/2019.
//  Copyright © 2019 Blazej SLEBODA. All rights reserved.
//

import XCTest

class  Button: XCTestCase {
    func testButtonInitOptional() {
        XCTAssertNil(Calculator.Button(rawValue:"k"))
        XCTAssertEqual(Calculator.Button(rawValue:"+"), .plus)
        XCTAssertEqual(Calculator.Button(rawValue:"-"), .minus)
        XCTAssertEqual(Calculator.Button(rawValue:"="), .equal)
        XCTAssertEqual(Calculator.Button(rawValue:"ac"), .ac)
        XCTAssertEqual(Calculator.Button(rawValue:"+/-"), .sign)
        XCTAssertEqual(Calculator.Button(rawValue:"x"), .multiply)
        XCTAssertEqual(Calculator.Button(rawValue:"/"), .divide)
        XCTAssertEqual(Calculator.Button(rawValue:"%"), .percent)
        XCTAssertEqual(Calculator.Button(rawValue:"."), .decimalSeparator)
        XCTAssertEqual(Calculator.Button(rawValue:"0"), .zero)
        XCTAssertEqual(Calculator.Button(rawValue:"1"), .one)
        XCTAssertEqual(Calculator.Button(rawValue:"2"), .two)
        XCTAssertEqual(Calculator.Button(rawValue:"3"), .three)
        XCTAssertEqual(Calculator.Button(rawValue:"4"), .four)
        XCTAssertEqual(Calculator.Button(rawValue:"5"), .five)
        XCTAssertEqual(Calculator.Button(rawValue:"6"), .six)
        XCTAssertEqual(Calculator.Button(rawValue:"7"), .seven)
        XCTAssertEqual(Calculator.Button(rawValue:"8"), .eight)
        XCTAssertEqual(Calculator.Button(rawValue:"9"), .nine)
    }
    func testButtonRawValue() {
        XCTAssertEqual(Calculator.Button.plus.rawValue, "+")
        XCTAssertEqual(Calculator.Button.minus.rawValue, "-")
        XCTAssertEqual(Calculator.Button.equal.rawValue, "=")
        XCTAssertEqual(Calculator.Button.ac.rawValue, "ac")
        XCTAssertEqual(Calculator.Button.sign.rawValue, "+/-")
        XCTAssertEqual(Calculator.Button.multiply.rawValue, "x")
        XCTAssertEqual(Calculator.Button.divide.rawValue, "/")
        XCTAssertEqual(Calculator.Button.percent.rawValue, "%")
        XCTAssertEqual(Calculator.Button.decimalSeparator.rawValue, ".")
        XCTAssertEqual(Calculator.Button.zero.rawValue, "0")
        XCTAssertEqual(Calculator.Button.one.rawValue, "1")
        XCTAssertEqual(Calculator.Button.two.rawValue, "2")
        XCTAssertEqual(Calculator.Button.three.rawValue, "3")
        XCTAssertEqual(Calculator.Button.four.rawValue, "4")
        XCTAssertEqual(Calculator.Button.five.rawValue, "5")
        XCTAssertEqual(Calculator.Button.six.rawValue, "6")
        XCTAssertEqual(Calculator.Button.seven.rawValue, "7")
        XCTAssertEqual(Calculator.Button.eight.rawValue, "8")
        XCTAssertEqual(Calculator.Button.nine.rawValue, "9")
    }
}
