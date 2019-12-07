import XCTest

class MathematicalOperandTests: XCTestCase {
    func testOptionalInit() {
        XCTAssertEqual(Calculator.MathematicalOperand(rawValue: "+"), Calculator.MathematicalOperand.plus)
        XCTAssertEqual(Calculator.MathematicalOperand(rawValue: "-"), .minus)
        XCTAssertEqual(Calculator.MathematicalOperand(rawValue: "="), .equal)
        XCTAssertEqual(Calculator.MathematicalOperand(rawValue: "x"), .multiply)
        XCTAssertEqual(Calculator.MathematicalOperand(rawValue: "/"), .divide)
        XCTAssertEqual(Calculator.MathematicalOperand(rawValue: "*"), nil)
    }
    
    func testRawValue() {
        XCTAssertEqual(Calculator.MathematicalOperand.plus.rawValue, "+")
        XCTAssertEqual(Calculator.MathematicalOperand.minus.rawValue, "-")
        XCTAssertEqual(Calculator.MathematicalOperand.equal.rawValue, "=")
        XCTAssertEqual(Calculator.MathematicalOperand.multiply.rawValue, "x")
        XCTAssertEqual(Calculator.MathematicalOperand.divide.rawValue, "/")
    }
}

