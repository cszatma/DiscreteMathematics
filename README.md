# Discrete Mathematics

[![Language Swift](https://img.shields.io/badge/Language-Swift%204.0-orange.svg?style=flat)](https://swift.org)
[![Version](https://img.shields.io/cocoapods/v/DiscreteMathematics.svg?style=flat)](http://cocoapods.org/pods/DiscreteMathematics)
[![License](https://img.shields.io/cocoapods/l/DiscreteMathematics.svg?style=flat)](http://cocoapods.org/pods/DiscreteMathematics)
[![Platform](https://img.shields.io/cocoapods/p/DiscreteMathematics.svg?style=flat)](http://cocoapods.org/pods/DiscreteMathematics)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

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
<br>
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
<br>
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

### Requirements
* iOS 8.0+
* macOS 10.9+
* tvOS 9.0+
* watchOS  2.0+
* Linux
* Swift 4

### CocoaPods

DiscreteMathematics is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DiscreteMathematics', '~> 1.1'
```

### Swift Package Manager

DiscreteMathematics is available through the [Swift Package Manager](https://swift.org/package-manager/)
To install it, add the following to your `Package.swift`.

```swift
import PackageDescription

let package = Package(
    name: "MyProject",
    dependencies: [
        .package(url: "https://github.com/cszatma/DiscreteMathematics.git", from: "1.1.0")
    ]
)
```

## Contributing
Open an issue or submit a pull request.
