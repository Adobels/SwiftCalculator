//
//  CalculatorTests.swift
//  SwiftCalculator
//
//  Created by Blazej SLEBODA on 14/06/2019.
//  Copyright © 2019 Blazej SLEBODA. All rights reserved.
//

import XCTest

class KalkonTests: XCTestCase {
    
    func testKalkonInit() {
        let kalkon = Calculator()
        XCTAssertEqual(kalkon.display, "0")
    }
    
    func testKalkonAc() {
        let kalkon = Calculator()
        kalkon.tapTwo()
        kalkon.tapTwo()
        kalkon.tapPlus()
        kalkon.tapThree()
        kalkon.tapEqual()
        
        kalkon.tapAc()
        XCTAssertEqual(kalkon.display, "0")
    }
    
    func testSign() {
        let kalkon = Calculator()
        kalkon.tapSign()
        XCTAssertEqual(kalkon.display, "-0")
        kalkon.tapAc()
        XCTAssertEqual(kalkon.display, "0")
        kalkon.tapSign()
        XCTAssertEqual(kalkon.display, "-0")
        kalkon.tapOne()
        XCTAssertEqual(kalkon.display, "-1")
        kalkon.tapEqual()
        XCTAssertEqual(kalkon.display, "-1")
    }
    
    func testSignAfterDidOperation() {
        let kalkon = Calculator()
        kalkon.tapOne()
        kalkon.tapPlus()
        kalkon.tapThree()
        kalkon.tapEqual()
        kalkon.tapSign()
        XCTAssertEqual(kalkon.display, "-4")
    }
    
    func testNumericButtons() {
        let kalkon = Calculator()
        kalkon.tapZero()
        XCTAssertEqual(kalkon.display, "0")
        kalkon.tapAc()
        kalkon.tapOne()
        XCTAssertEqual(kalkon.display, "1")
        kalkon.tapAc()
        kalkon.tapTwo()
        XCTAssertEqual(kalkon.display, "2")
        kalkon.tapAc()
        kalkon.tapThree()
        XCTAssertEqual(kalkon.display, "3")
        kalkon.tapAc()
        kalkon.tapFour()
        XCTAssertEqual(kalkon.display, "4")
        kalkon.tapAc()
        kalkon.tapFive()
        XCTAssertEqual(kalkon.display, "5")
        kalkon.tapAc()
        kalkon.tapSix()
        XCTAssertEqual(kalkon.display, "6")
        kalkon.tapAc()
        kalkon.tapSeven()
        XCTAssertEqual(kalkon.display, "7")
        kalkon.tapAc()
        kalkon.tapEight()
        XCTAssertEqual(kalkon.display, "8")
        kalkon.tapAc()
        kalkon.tapNine()
        XCTAssertEqual(kalkon.display, "9")
    }
    
    func testPlusEqualSign() {
        let kalkon = Calculator()
        kalkon.tapTwo()
        kalkon.tapTwo()
        XCTAssertEqual(kalkon.display, "22", "tap 2 tap 2")
        kalkon.tapPlus()
        XCTAssertEqual(kalkon.display, "22", "tap 2 tap 2 tap Plus")
        kalkon.tapThree()
        XCTAssertEqual(kalkon.display, "3", "tap 2 tap 2 tap Plus tap 3")
        kalkon.tapEqual()
        XCTAssertEqual(kalkon.display, "25", "22 + 3 = 25")
        
        kalkon.tapMinus()
        kalkon.tapFive()
        
        XCTAssertEqual(kalkon.display, "5")
        
        kalkon.tapSign()
        
        XCTAssertEqual(kalkon.display, "-5")
        
        kalkon.tapMinus()
        
        XCTAssertEqual(kalkon.display, "30")
        kalkon.tapFive()
        XCTAssertEqual(kalkon.display, "5")
    }
    
    func testKalkon22Plus3Equal25() {
        let kalkon = Calculator()
        kalkon.tapTwo()
        XCTAssertEqual(kalkon.display, "2")
        kalkon.tapTwo()
        XCTAssertEqual(kalkon.display, "22")
        kalkon.tapPlus()
        XCTAssertEqual(kalkon.display, "22")
        kalkon.tapThree()
        XCTAssertEqual(kalkon.display, "3")
        kalkon.tapEqual()
        XCTAssertEqual(kalkon.display, "25")
        kalkon.tapAc()
        XCTAssertEqual(kalkon.display, "0")
    }
    
    func testKalkonGrouping() {
        let kalkon = Calculator()
        kalkon.tapTwo()
        kalkon.tapTwo()
        kalkon.tapTwo()
        kalkon.tapTwo()
        XCTAssertEqual(kalkon.display, "2 222")
    }
    
    func testEqual() {
        let kalkon = Calculator()
        kalkon.tapZero()
        kalkon.tapDecimalSpeparator()
        kalkon.tapTwo()
        kalkon.tapEqual()
        XCTAssertEqual(kalkon.display, "0.2")
    }
    
    func testPlus() {
        let kalkon = Calculator()
        kalkon.tapZero()
        kalkon.tapDecimalSpeparator()
        kalkon.tapTwo()
        kalkon.tapPlus()
        XCTAssertEqual(kalkon.display, "0.2")
    }
    
    func testMinus() {
        let kalkon = Calculator()
        kalkon.tapZero()
        kalkon.tapDecimalSpeparator()
        kalkon.tapTwo()
        kalkon.tapMinus()
        XCTAssertEqual(kalkon.display, "0.2")
    }
    
    func testMultiply2() {
        let kalkon = Calculator()
        kalkon.tapAc()
        kalkon.tapZero()
        kalkon.tapDecimalSpeparator()
        kalkon.tapTwo()
        kalkon.tapMultiply()
        XCTAssertEqual(kalkon.display, "0.2")
    }
    
    func testMultiply() {
        let kalkon = Calculator()
        kalkon.tapTwo()
        kalkon.tapMultiply()
        kalkon.tapFive()
        kalkon.tapEqual()
        XCTAssertEqual(kalkon.display, "10")
        kalkon.tapAc()
        kalkon.tapZero()
        kalkon.tapDecimalSpeparator()
        kalkon.tapTwo()
        kalkon.tapMultiply()
        XCTAssertEqual(kalkon.display, "0.2")
    }
    
    func testDivide() {
        let kalkon = Calculator()
        kalkon.tapFive()
        kalkon.tapDivide()
        kalkon.tapFive()
        kalkon.tapEqual()
        XCTAssertEqual(kalkon.display, "1")
        kalkon.tapAc()
        kalkon.tapZero()
        kalkon.tapDecimalSpeparator()
        kalkon.tapTwo()
        kalkon.tapDivide()
        XCTAssertEqual(kalkon.display, "0.2")
    }
    
    func testInput() {
        let input = Input()
        input.append("0")
        input.hasExponent = true
        XCTAssertEqual(input.string, "0.")
        input.append("0")
        XCTAssertEqual(input.string, "0.0")
        input.append("7")
        XCTAssertEqual(input.string, "0.07")
    }
    
    func testSeparator() {
        let kalkon = Calculator()
        kalkon.tapDecimalSpeparator()
        XCTAssertEqual(kalkon.display, "0.")
        kalkon.tapZero()
        XCTAssertEqual(kalkon.display, "0.0")
        kalkon.tapSeven()
        XCTAssertEqual(kalkon.display, "0.07")
    }
    
    func testPercentSum() {
        let kalkon = Calculator()
        kalkon.tapNine()
        kalkon.tapZero()
        kalkon.tapPlus()
        kalkon.tapOne()
        kalkon.tapZero()
        kalkon.tapPercent()
        kalkon.tapEqual()
        XCTAssertEqual(kalkon.display, "99")
    }
    
    func testPercentageSubstraction() {
        let k = Calculator()
        k.tapNine()
        k.tapZero()
        XCTAssertEqual(k.display, "90")
        k.tapMinus()
        
        XCTAssertEqual(k.selectedOperation, .minus)
        k.tapOne()
        k.tapZero()
        k.tapPercent()
        XCTAssertEqual(k.display, "9")
        k.tapEqual()
        XCTAssertEqual(k.display, "81")
    }
    
    func testPercentageMultiplication() {
        let k = Calculator()
        k.tapFive()
        k.tapZero()
        k.tapMultiply()
        k.tapTwo()
        k.tapFive()
        k.tapPercent()
        XCTAssertEqual(k.display, "0.25")
        k.tapEqual()
        XCTAssertEqual(k.display, "12.5")
    }
    
    func testPercentageDivide() {
        let k = Calculator()
        k.tapFive()
        k.tapZero()
        k.tapDivide()
        k.tapTwo()
        k.tapFive()
        k.tapPercent()
        XCTAssertEqual(k.display, "0.25")
        k.tapEqual()
        XCTAssertEqual(k.display, "200")
    }
    
    func testPercentage() {
        let kalkon = Calculator()
        kalkon.tapPercent()
        XCTAssertEqual(kalkon.display, "0")
        kalkon.tapAc()
        kalkon.tapSign()
        kalkon.tapPercent()
        XCTAssertEqual(kalkon.display, "0")
    }
    
    func testPercentageInput() {
        let kalkon = Calculator()
        kalkon.tapNine()
        XCTAssertEqual(kalkon.display, "9")
        kalkon.tapPercent()
        XCTAssertEqual(kalkon.display, "0.09")
    }
    
    func testDivideByZero() {
        let kalkon = Calculator()
        kalkon.tapSeven()
        kalkon.tapDivide()
        kalkon.tapZero()
        kalkon.tapEqual()
        XCTAssertEqual(kalkon.display, "NaN")
    }
    
    func testTapButton() {
        let kalkon = Calculator()
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "0"), "0")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "ac"), "0")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "1"), "1")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "2"), "12")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "3"), "123")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "4"), "1 234")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "5"), "12 345")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "6"), "123 456")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "7"), "1 234 567")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "8"), "12 345 678")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "9"), "123 456 789")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "."), "123 456 789.")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "0"), "123 456 789.0")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "x"), "123 456 789 x")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "2"), "2")
        XCTAssertEqual(kalkon.calculatorButtonWithTitleClicked(text: "="), "246 913 578 =")
    }
 
    func testDivideFloatingPoint() {
        let kalkon = Calculator()
        kalkon.tapSeven()
        kalkon.tapDivide()
        kalkon.tapSix()
        kalkon.tapSix()
        kalkon.tapEqual()
        XCTAssertEqual(kalkon.display, "0.1060606")
    }
    
    func testDivideFloatingPoint2() {
        let kalkon = Calculator()
        kalkon.tapSeven()
        kalkon.tapDivide()
        kalkon.tapNine()
        kalkon.tapNine()
        kalkon.tapNine()
        kalkon.tapEqual()
        XCTAssertEqual(kalkon.display, "0.007007")
    }
    
    func testFloatingPointChangeMagnitude() {
        let kalkon = Calculator()
        kalkon.tapSeven()
        kalkon.tapDecimalSpeparator()
        kalkon.tapSix()
        kalkon.tapSeven()
        kalkon.tapTwo()
        kalkon.tapThree()
        kalkon.tapMultiply()
        kalkon.tapOne()
        kalkon.tapZero()
        kalkon.tapEqual()
        XCTAssertEqual(kalkon.display, "76.723")
    }
    
}

