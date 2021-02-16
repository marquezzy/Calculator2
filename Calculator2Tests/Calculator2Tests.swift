//
//  Calculator2Tests.swift
//  Calculator2Tests
//
//  Created by mark.gallegos on 2/16/21.
//

import XCTest
@testable import Calculator2

class Calculator2Tests: XCTestCase {

    func testSuccess() throws {
        let samples: [(String, Double)] = [
            ("40 + 2", 42.0),
            ("2 + 4 × 10", 42.0)
        ]

        for sample in samples {
            let interpreter = Interpreter(parser: ArithmeticParserWrapper(), virtualMachine: VirtualMachine())

            switch interpreter.evaluate(sample.0) {
                case .success(let value):
                    XCTAssertEqual(value, sample.1)
                case .failure(let error):
                    XCTFail("Error evaluating expression '\(sample.0)': expected: \(sample.1); got: \(error)")
            }
        }
    }
}
