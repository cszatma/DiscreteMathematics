//
//  DiscreteMathematicsTests.swift
//  DiscreteMathematics
//
//  Created by Christopher Szatmary on 2017-11-26.
//  Copyright © 2017 DiscreteMathematics. All rights reserved.
//

import Foundation
import XCTest
import DiscreteMathematics

class DiscreteMathematicsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //// XCTAssertEqual(DiscreteMathematics().text, "Hello, World!")
    }
    
    static var allTests = [
        ("testExample", testExample),
        ("testCongruenceModulo", testCongruenceModulo),
        ("testDivides", testDivides),
        ("testGCD", testGCD),
        ("testEGCD", testEGCD),
        ("testCoprime", testCoprime),
        ("testLDE", testLDE),
        ("testLDESolutions", testLDESolutions),
        ("testLinearCongruence", testLinearCongruence),
        ("testLinearCongruenceSimplified", testLinearCongruenceSimplified),
        ("testLinearCongruenceSolutions", testLinearCongruenceSolutions),
    ]

    func testCongruenceModulo() {
        XCTAssertEqual(3 ==% (15, 12), true)
        XCTAssertEqual(-8 ==% (7, 5), true)
        XCTAssertEqual(2 ==% (8, 5), false)
    }

    func testDivides() {
        XCTAssertEqual(3 |% 9, true)
        XCTAssertEqual(2 |% 7, false)
    }

    func testGCD() {
        XCTAssertEqual(gcd(5005, 4410), 35)
        XCTAssertEqual(gcd(-5005, -4410), 35)
        XCTAssertEqual(gcd(175, 155), 5)
    }

    func testEGCD() {
        XCTAssertTrue(egcd(5005, 4410) == (35, -37, 42))
        XCTAssertTrue(egcd(-5005, -4410) == (35, -37, 42))
        XCTAssertTrue(egcd(175, 155) == (5, 8, -9))
    }

    func testCoprime() {
        XCTAssertEqual(coprime(17, -60), true)
    }

    func testLDE() {
        XCTAssertTrue(lde(a: 234, b: 182, c: 260)! == (-30, 40))
        XCTAssertTrue(lde(a: 175, b: 155, c: 50)! == (80, -90))
        XCTAssertTrue(lde(a: 234, b: 182, c: 10) == nil)
    }

    func testLDESolutions() {
        XCTAssertTrue(ldeSolutions(a: 175, b: 155, c: 50)!(3) == (173, -195))
    }

    func testLinearCongruence() {
        XCTAssertEqual(linearCongruence(a: 234, b: 260, m: 182), -30)
    }

    func testLinearCongruenceSimplified() {
        let x0 = linearCongruence(a: 234, b: 260, m: 182)
        let x1 = linearCongruenceSimplified(a: 234, b: 260, m: 182)
        XCTAssertTrue(x0! ==% (x1!, 182 / gcd(234, 182)))
    }

    func testLinearCongruenceSolutions() {
        let solutions = linearCongruenceSolutions(a: 234, b: 260, m: 182)!
        let s1 = solutions(3), s2 = solutions(9), s3 = solutions(-10)
        XCTAssertTrue(s1 ==% (s2, 182 / gcd(234, 182)))
        XCTAssertTrue(s2 ==% (s3, 182 / gcd(234, 182)))
        XCTAssertTrue(s1 ==% (s3, 182 / gcd(234, 182)))
    }
}
