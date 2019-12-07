//
//  InputTests.swift
//  SwiftCalculatorTests
//
//  Created by Blazej SLEBODA on 07/12/2019.
//  Copyright © 2019 Blazej SLEBODA. All rights reserved.
//

import XCTest

class InputTests: XCTestCase {
    func testSetTextMinus() {
        let calc = Calculator()
        calc.input.setToString("-40")
        XCTAssertEqual(calc.input.string, "-40")
    }
    func testSetTextNotNumber() {
        let calc = Calculator()
        calc.input.setToString("-40.0k")
        XCTAssertEqual(calc.input.decimalNumber, 0)
    }
    func testSetTextMantisaOnlyNotNumber() {
        let calc = Calculator()
        calc.input.setToString("-4k")
        XCTAssertEqual(calc.input.decimalNumber, 0)
    }
    func testStringForWrongExponenta() {
        let calc = Calculator()
        calc.input.setToString("-40.0k")
        XCTAssertEqual(calc.input.string, "-0")
    }
    func testStringForWrongMantissa() {
        let calc = Calculator()
        calc.input.setToString("-4k")
        XCTAssertEqual(calc.input.string, "-0")
    }
}
