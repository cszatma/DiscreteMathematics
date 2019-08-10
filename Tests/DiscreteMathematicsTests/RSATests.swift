//
//  RSATests.swift
//  DiscreteMathematics
//
//  Created by Christopher Szatmary on 2019-08-10.
//

@testable import DiscreteMathematics
import Nimble
import Quick

final class RSATests: QuickSpec {
    override func spec() {
        describe("RSA.swift tests") {
            it("encrypts and decrypts the string") {
                let encrypted = encrypt(string: "hi", e: 3, pq: 55)
                let decrypted = decrypt(string: encrypted, d: 27, pq: 55)
                expect(decrypted).to(equal("hi"))
            }
        }
    }
}
