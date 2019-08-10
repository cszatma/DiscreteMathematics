//
//  OperatorsTests.swift
//  DiscreteMathematics
//
//  Created by Christopher Szatmary on 2019-08-10.
//

@testable import DiscreteMathematics
import Nimble
import Quick

final class OperatorsTests: QuickSpec {
    override func spec() {
        describe("Operators.swift tests") {
            describe("==% tests") {
                it("returns true when a is congruent to be mod m") {
                    expect(3 ==% (15, 12)).to(beTrue())
                    expect(-8 ==% (7, 5)).to(beTrue())
                }

                it("returns false when a is not congruent to be mod m") {
                    expect(2 ==% (8, 5)).to(beFalse())
                }
            }

            describe("|% tests") {
                it("returns true when the lhs divides the rhs") {
                    expect(3 |% 9).to(beTrue())
                }

                it("returns false when the lhs does not divide the rhs") {
                    expect(2 |% 7).to(beFalse())
                }
            }

            describe("** tests") {
                it("returns the integer applied to the given power") {
                    expect(2 ** 4).to(equal(16))
                    expect(3 ** 5).to(equal(243))
                }
            }
        }
    }
}
