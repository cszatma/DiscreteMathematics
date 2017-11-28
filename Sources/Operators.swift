//
//  Operators.swift
//  DiscreteMathematics
//
// Created by Christopher Szatmary on 2017-11-26.
// Copyright (c) 2017 DiscreteMathematics. All rights reserved.
//

import Foundation

infix operator ==%: ComparisonPrecedence
infix operator |%: ComparisonPrecedence

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
