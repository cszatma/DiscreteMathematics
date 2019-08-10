//
//  SequencesTests.swift
//  DiscreteMathematics
//
//  Created by Christopher Szatmary on 2019-08-10.
//

@testable import DiscreteMathematics
import Nimble
import Quick

final class SequencesTests: QuickSpec {
    override func spec() {
        describe("Sequences.swift tests") {
            describe("summationt tests") {
                it("returns the summation with the given closure") {
                    let result = summation(lower: 0, upper: 5) { Double($0) * 2 }
                    expect(result).to(equal(30))
                }
            }

            describe("product tests") {
                it("returns the product with the given closure") {
                    let result = product(lower: 0, upper: 5) { Double($0) + 1 }
                    expect(result).to(equal(720))
                }
            }
        }
    }
}
