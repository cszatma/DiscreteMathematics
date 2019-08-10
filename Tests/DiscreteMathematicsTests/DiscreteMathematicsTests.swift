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
        ("testCommonSolutionOfLinearCongruences", testCommonSolutionOfLinearCongruences),
        ("testRepeatedSquaringAlgorithm", testRepeatedSquaringAlgorithm),
        ("testModularExponent", testModularExponent),
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
    
    func testCommonSolutionOfLinearCongruences() {
        let x0 = commonSolutionOfLinearCongruences(a: 9, m: 13, b: 2, n: 5)!
        XCTAssertTrue(x0 ==% (22, 13*5))
        XCTAssertTrue(x0 ==% (commonSolutionOfLinearCongruences(a: -4, m: 13, b: 5007, n: 5)!, 13*5))
    }
    
    func testRepeatedSquaringAlgorithm() {
        XCTAssertTrue(repeatedSquaringAlgorithm(base: 1915, exponent: 128, mod: 10781) ==% (4592, 10781))
        XCTAssertTrue(repeatedSquaringAlgorithm(base: 1915, exponent: 64, mod: 10781) ==% (3729 * 3729, 10781))
    }
    
    func testModularExponent() {
        XCTAssertTrue(modularExponent(base: 1915, exponent: 131, mod: 10781) ==% (9086, 10781))
        XCTAssertTrue(modularExponent(base: 9086, exponent: 2551, mod: 10781) ==% (1915, 10781))
        XCTAssertTrue(modularExponent(base: 2017, exponent: 100345, mod: 2034) ==% (1963, 2034))
        XCTAssertTrue(modularExponent(base: 17, exponent: 2015, mod: 5) ==% (3, 5))
        XCTAssertTrue(modularExponent(base: 46, exponent: 1001, mod: 100) ==% (96, 100))
    }
    
    func testRSA() {
        let encrypted = encrypt(string: "hi", e: 3, pq: 55)
        let decrypted = decrypt(string: encrypted, d: 27, pq: 55)
        print(encrypted)
        print(decrypted)
        print(14 % 55)
        print(modularExponent(base: 675, exponent: 307, mod: 713))
    }
}
