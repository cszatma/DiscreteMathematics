//    MIT License
//
//    Copyright (c) 2019 Christopher Szatmary <cs@christopherszatmary.com>
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.

import Foundation

public let alphabetNumbers = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8, "i": 9, "j": 10, "k": 11, "l": 12, "m": 13, "n": 14, "o": 15, "p": 16, "q": 17, "r": 18, "s": 19, "t": 20, "u": 21, "v": 22, "w": 23, "x": 24, "y": 25, "z": 26]

public let alphabetValues = [1: "a", 2: "b", 3: "c", 4: "d", 5: "e", 6: "f", 7: "g", 8: "h", 9: "i", 10: "j", 11: "k", 12: "l", 13: "m", 14: "n", 15: "o", 16: "p", 17: "q", 18: "r", 19: "s", 20: "t", 21: "u", 22: "v", 23: "w", 24: "x", 25: "y", 26: "z"]

public func encryptValue(m: Int, e: Int, pq: Int) -> Int {
    return modularExponent(base: m, exponent: e, mod: pq)
}

public func decryptValue(c: Int, d: Int, pq: Int) -> Int {
    return modularExponent(base: c, exponent: d, mod: pq)
}

public func encrypt(array: [Int], e: Int, pq: Int) -> [Int] {
    return array.map({ encryptValue(m: $0, e: e, pq: pq) })
}

public func encrypt(string: String, e: Int, pq: Int) -> String {
    return encrypt(array: string.flatMap({ alphabetNumbers[String($0)] }), e: e, pq: pq).flatMap({ alphabetValues[$0] }).joined()
}

public func decrypt(array: [Int], d: Int, pq: Int) -> [Int] {
    return array.map({ decryptValue(c: $0, d: d, pq: pq) })
}

public func decrypt(string: String, d: Int, pq: Int) -> String {
    return decrypt(array: string.flatMap({ alphabetNumbers[String($0)] }), d: d, pq: pq).flatMap({ alphabetValues[$0] }).joined()
}
