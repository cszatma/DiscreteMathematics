//    The MIT License (MIT)
//
//    Copyright (c) 2017 Christopher Szatmary
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

// MARK: - Helper Functions

/// Checks for modular congruence between a and b.
public func congruenceModulo(a: Int, b: Int, m: Int) -> Bool {
    return a ==% (b, m)
}

/// Checks if a divides b.
public func divides(a: Int, b: Int) -> Bool {
    return a |% b
}

/// Performs division on two integers and returns the quotient and remainder. a = q · b + r
public func longDivision(a: Int, b: Int) -> (q: Int, r: Int) {
    return (a / b, a % b)
}

/// Returns the greatest common divisor of two integers using the Euclidean Algorithm.
public func gcd(_ a: Int, _ b: Int) -> Int {
    guard b != 0 else { return abs(a) }
    return gcd(b, a % b)
}

/// Returns the greatest common divisor of two integers as an integer combination using the Extended Euclidean Algorithm
/// a · x + b · y = d
public func egcd(_ a: Int, _ b: Int) -> (d: Int, x: Int, y: Int) {
    guard b != 0 else { return (abs(a), 1, 0) }
    let (d, x, y) = egcd(b, a % b)
    return (d, y, x - (a / b) * y)
}

/// Checks if two integers are coprime. Two integers, a, b, are coprime iff gcd(a, b) == 1.
public func coprime(_ a: Int, _ b: Int) -> Bool {
    return gcd(a, b) == 1
}

/// Returns a solution to the given Linear Diophantine Equation or `nil` if it has no solutions.
/// a · x + b · y = c
public func lde(a: Int, b: Int, c: Int) -> (x: Int, y: Int)? {
    let (d, x, y) = egcd(a, b)
    guard d |% c else { return nil }
    let q = c / d
    return (x * q, y * q)
}

/// Returns a function that when passed an integer, n, will return the corresponding solutions to the LDE.
public func ldeSolutions(a: Int, b: Int, c: Int) -> ((Int) -> (x: Int, y: Int))? {
    guard let (x0, y0) = lde(a: a, b: b, c: c) else { return nil }
    let d = gcd(a, b)
    return { n in (x0 + (b * n) / d, y0 - (a * n) / d) }
}

/// Returns a solution to the given Linear Congruence or `nil` if it has no solutions.
/// a · x ≡ b(mod m)
public func linearCongruence(a: Int, b: Int, m: Int) -> Int? {
    return lde(a: a, b: m, c: b)?.x
}

/// Uses modular congruence to solve the given linear congruence in a simplified way.
public func linearCongruenceSimplified(a: Int, b: Int, m: Int) -> Int? {
    return lde(a: a % m, b: m, c: b % m)?.x
}

/// Returns a function that when passed an integer, `n`, will return all solutions to the given linear
/// congruence. If no solutions exist it will return `nil`.
public func linearCongruenceSolutions(a: Int, b: Int, m: Int) -> ((Int) -> Int)? {
    guard let x0 = linearCongruenceSimplified(a: a, b: b, m: m) else { return nil }
    return { n in x0 + (m * n) / gcd(a, m) }
}
