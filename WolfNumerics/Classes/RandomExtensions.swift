//
//  SeededRandomNumberGenerator.swift
//  WolfNumerics
//
//  Created by Wolf McNally on 10/15/18.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

extension Double {
    /// Returns a random number in the half-open interval
    public static func random(in interval: Interval<Double>) -> Double {
        return Double.random(in: 0 ..< 1).lerpedFromFrac(to: interval)
    }

    /// Returns a random number in the half-open interval
    public static func random<T>(in interval: Interval<Double>, using generator: inout T) -> Double where T: RandomNumberGenerator {
        return Double.random(in: 0 ..< 1, using: &generator).lerpedFromFrac(to: interval)
    }

    /// Returns a random Frac
    public static func randomFrac() -> Frac {
        return Double.random(in: 0 ... 1)
    }

    /// Returns a random Frac
    public static func randomFrac<T>(using generator: inout T) -> Frac where T: RandomNumberGenerator {
        return Double.random(in: 0 ... 1)
    }
}

extension Float {
    /// Returns a random number in the half-open interval
    public static func random(in interval: Interval<Float>) -> Float {
        return Float.random(in: 0 ..< 1).lerpedFromFrac(to: interval)
    }

    /// Returns a random number in the half-open interval
    public static func random<T>(in interval: Interval<Float>, using generator: inout T) -> Float where T: RandomNumberGenerator {
        return Float.random(in: 0 ..< 1, using: &generator).lerpedFromFrac(to: interval)
    }
}

extension CGFloat {
    /// Returns a random number in the half-open interval
    public static func random(in interval: Interval<CGFloat>) -> CGFloat {
        return CGFloat.random(in: 0 ..< 1).lerpedFromFrac(to: interval)
    }

    /// Returns a random number in the half-open interval
    public static func random<T>(in interval: Interval<CGFloat>, using generator: inout T) -> CGFloat where T: RandomNumberGenerator {
        return CGFloat.random(in: 0 ..< 1, using: &generator).lerpedFromFrac(to: interval)
    }
}

extension UUID {
    public static func random<T>(using generator: inout T) -> UUID where T: RandomNumberGenerator {
        var bytes = (0 ..< 16).map { _ in UInt8.random(in: UInt8.min ... UInt8.max, using: &generator) }
        return UUID(uuid: (bytes[0], bytes[1], bytes[2], bytes[3],
                           bytes[4], bytes[5], bytes[6], bytes[7],
                           bytes[8], bytes[9], bytes[10], bytes[11],
                           bytes[12], bytes[13], bytes[14], bytes[15]))
    }
}

extension Collection {
    public func randomIndex() -> Index {
        let offset = Int.random(in: 0 ..< count)
        return index(startIndex, offsetBy: offset)
    }

    public func randomIndex<T>(using generator: inout T) -> Index where T: RandomNumberGenerator {
        let offset = Int.random(in: 0 ..< count, using: &generator)
        return index(startIndex, offsetBy: offset)
    }

    public func randomElement() -> Element {
        return self[randomIndex()]
    }

    public func randomElement<T>(using generator: inout T) -> Element where T: RandomNumberGenerator {
        return self[randomIndex(using: &generator)]
    }
}

public func randomChoice<T>(_ choices: T...) -> T {
    return choices.randomElement()
}

public func randomChoice<G, T>(using generator: inout G, _ choices: T...) -> T where G: RandomNumberGenerator {
    return choices.randomElement(using: &generator)
}
