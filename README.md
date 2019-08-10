# Discrete Mathematics

[![Language Swift](https://img.shields.io/badge/Language-Swift%205.0-orange.svg?style=for-the-badge&logo=swift)](https://swift.org)
[![CI Status](https://img.shields.io/circleci/build/github/cszatma/DiscreteMathematics?logo=CircleCI&style=for-the-badge)](https://circleci.com/gh/cszatma/DiscreteMathematics)
[![Release Version](https://img.shields.io/github/release/cszatma/DiscreteMathematics.svg?style=for-the-badge)](https://github.com/cszatma/DiscreteMathematics/releases)
![Platforms](https://img.shields.io/badge/Platforms-macOS%20Linux-lightgrey.svg?style=for-the-badge&logo=linux)
[![License](https://img.shields.io/github/license/cszatma/DiscreteMathematics.svg?style=for-the-badge)](https://github.com/cszatma/DiscreteMathematics/blob/master/LICENSE)
[![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg?style=for-the-badge)](https://swift.org/package-manager/)

**DiscreteMathematics** is a set of algorithm implementations from Discrete Mathematics.

## Examples

### Operators
#### Congruence Modulo n `==%`:
The equivalence relation a ≡ b(mod m) ↔ m | (b - a).
```swift
-8 ==% (7, 5) // true
2 ==% (8, 5) // false
```

#### Divides `|%`:
Returns whether or not a|b ↔ ∃ q ∈ N, b = q · a.
```swift
3 |% 9 // true
2 |% 7 // false
```

### Functions
#### Long Division 
Performs division on two integers and returns the quotient and remainder.

a = q · b + r
```swift
longDivision(a: 8, b: 3) // (q: 2, r: 2)
```

#### Greatest Common Divisor
`gcd()` returns the greatest common divisor using the Euclidean Algorithm.
```swift
gcd(5005, 4410) // 35
gcd(175, 155) // 5
```

`egcd()` returns the GCD of two integers as an integer combination using the Extended Euclidean Algorithm.

 a · x + b · y = d
 ```swift
egcd(5005, 4410) // (d: 35, x: -37, y: 42)
egcd(175, 155) // (d: 5, x: 8, y: -9)
```

#### Coprime
Two elements, a, b, are coprime if gcd(a, b) = 1.
```swift
coprime(17, -60) // true
```

#### Linear Diophantine Equation
`lde()` returns a solution to the given Linear Diophantine Equation or `nil` if it has no solutions.
```swift
lde(a: 175, b: 155, c: 50) // (x: 80, y: -90)
lde(a: 234, b: 182, c: 10) // nil
```

`ldeSolutions()` returns a function that will compute all possible solutions to an LDE.
```swift
let solutions = ldeSolutions(a: 175, b: 155, c: 50)
solutions!(3) // (173, -195)
```

## Installation

### Swift Package Manager

The recommended way to install `DiscreteMathematics` is by using the [Swift Package Manager](https://swift.org/package-manager/).

To install it, add the following to your `Package.swift`'s `dependencies` array:

```swift
.package(url: "https://github.com/cszatma/DiscreteMathematics.git", from: "2.0.0")
```

### CocoaPods

DiscreteMathematics is also available through [CocoaPods](http://cocoapods.org).

To install it, add the following line to your Podfile:

```ruby
pod 'DiscreteMathematics', '~> 2.0'
```

## License
DiscreteMathematics is available under the [MIT License](LICENSE).

## Contributing
Open an issue or submit a pull request.
