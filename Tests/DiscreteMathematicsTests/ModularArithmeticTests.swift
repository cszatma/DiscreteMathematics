//
//  ModularArithmeticTests.swift
//  DiscreteMathematics
//
//  Created by Christopher Szatmary on 2019-08-10.
//

@testable import DiscreteMathematics
import Nimble
import Quick

final class ModularArithmeticTests: QuickSpec {
    override func spec() {
        describe("ModularArithmetic.swift tests") {
            describe("gcd() tests") {
                it("calculates the gcd of the two integers") {
                    expect(gcd(5005, 4410)).to(equal(35))
                    expect(gcd(-5005, -4410)).to(equal(35))
                    expect(gcd(175, 155)).to(equal(5))
                }
            }

            describe("egcd() tests") {
                it("calculates the gcd as an integer combination") {
                    expect(egcd(5005, 4410) == (35, -37, 42)).to(beTrue())
                    expect(egcd(-5005, -4410) == (35, -37, 42)).to(beTrue())
                    expect(egcd(175, 155) == (5, 8, -9)).to(beTrue())
                }
            }

            describe("coprime() tests") {
                it("returns true when the integers are coprime") {
                    expect(coprime(17, -60)).to(beTrue())
                }

                it("returns false when the integers are not coprime") {
                    expect(coprime(15, 100)).to(beFalse())
                }
            }

            describe("lde() tests") {
                it("returns the solution to the Linear Diophantine Equation") {
                    expect(lde(a: 234, b: 182, c: 260)! == (-30, 40)).to(beTrue())
                    expect(lde(a: 175, b: 155, c: 50)! == (80, -90)).to(beTrue())
                }

                it("returns nil when there is no solution to the Linear Diophantine Equation") {
                    expect(lde(a: 234, b: 182, c: 10)).to(beNil())
                }
            }

            describe("ldeSolutions() tests") {
                it("returns a function that gives solutions for any integer") {
                    let solutions = ldeSolutions(a: 175, b: 155, c: 50)!
                    expect(solutions(3) == (173, -195)).to(beTrue())
                }
            }

            describe("linearCongruence() tests") {
                it("returns the solution to the linear congruence") {
                    expect(linearCongruence(a: 234, b: 260, m: 182)).to(equal(-30))
                }
            }

            describe("linearCongruenceSimplified() tests") {
                it("returns a simplified solution to the linear congruence") {
                    let x0 = linearCongruence(a: 234, b: 260, m: 182)!
                    let x1 = linearCongruenceSimplified(a: 234, b: 260, m: 182)!
                    expect(x0 ==% (x1, 182 / gcd(234, 182))).to(beTrue())
                }
            }

            describe("linearCongruenceSolutions() tests") {
                it("returns a function that gives solutions for any integer") {
                    let solutions = linearCongruenceSolutions(a: 234, b: 260, m: 182)!
                    let s1 = solutions(3)
                    let s2 = solutions(9)
                    let s3 = solutions(-10)

                    expect(s1 ==% (s2, 182 / gcd(234, 182))).to(beTrue())
                    expect(s2 ==% (s3, 182 / gcd(234, 182))).to(beTrue())
                    expect(s1 ==% (s3, 182 / gcd(234, 182))).to(beTrue())
                }
            }

            describe("commonSolutionOfLinearCongruences() tests") {
                it("returns a common solution to the linear congruence") {
                    let x0 = commonSolutionOfLinearCongruences(a: 9, m: 13, b: 2, n: 5)!
                    let x1 = commonSolutionOfLinearCongruences(a: -4, m: 13, b: 5007, n: 5)!

                    expect(x0 ==% (22, 13 * 5)).to(beTrue())
                    expect(x0 ==% (x1, 13 * 5)).to(beTrue())
                }
            }

            describe("repeatedSquaringAlgorithm() tests") {
                it("performs modular exponentiation using the repeated squaring algorithm for powers of 2") {
                    let e1 = repeatedSquaringAlgorithm(base: 1915, exponent: 128, mod: 10781)
                    let e2 = repeatedSquaringAlgorithm(base: 1915, exponent: 64, mod: 10781)

                    expect(e1 ==% (4592, 10781)).to(beTrue())
                    expect(e2 ==% (3729 * 3729, 10781)).to(beTrue())
                }
            }

            describe("modularExponent() tests") {
                it("performs modular exponentiation using the repeated squaring algorithm for any power") {
                    expect(modularExponent(base: 1915, exponent: 131, mod: 10781) ==% (9086, 10781)).to(beTrue())
                    expect(modularExponent(base: 9086, exponent: 2551, mod: 10781) ==% (1915, 10781)).to(beTrue())
                    expect(modularExponent(base: 2017, exponent: 100_345, mod: 2034) ==% (1963, 2034)).to(beTrue())
                    expect(modularExponent(base: 17, exponent: 2015, mod: 5) ==% (3, 5)).to(beTrue())
                    expect(modularExponent(base: 46, exponent: 1001, mod: 100) ==% (96, 100)).to(beTrue())
                }
            }
        }
    }
}
