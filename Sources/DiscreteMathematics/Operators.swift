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

infix operator ==%: ComparisonPrecedence
infix operator |%: ComparisonPrecedence
infix operator **: MultiplicationPrecedence

/// Congruence Modulo n relation.
/// ∀ a, b ∈ Z, a ≡ b(mod m) ↔ m | (b - a).
public func ==% (lhs: Int, rhs: (b: Int, m: Int)) -> Bool {
    return (rhs.b - lhs) % rhs.m == 0
}

/// Divides operator. Returns true if a divides b.
/// ∃ q ∈ N, b = q · a
public func |% (lhs: Int, rhs: Int) -> Bool {
    return rhs % lhs == 0
}

public extension Int {
    /// Power operator. Raises the integer on the left to the power of the integer on the right.
    public static func ** (lhs: Int, rhs: Int) -> Int {
        return Int(pow(Double(lhs), Double(rhs)))
    }
}
