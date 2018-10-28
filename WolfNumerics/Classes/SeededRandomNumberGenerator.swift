//
//  SeededRandomNumberGenerator.swift
//  WolfNumerics
//
//  Created by Wolf McNally on 10/28/18.
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

import GameKit

public final class SeededRandomNumberGenerator: RandomNumberGenerator {
    private let source: GKMersenneTwisterRandomSource
    private let distribution: GKRandomDistribution

    public init(seed: UInt64) {
        source = GKMersenneTwisterRandomSource(seed: seed)
        distribution = GKRandomDistribution(randomSource: source, lowestValue: Int(UInt16.min), highestValue: Int(UInt16.max))
    }

    public convenience init(seed: Int) {
        self.init(seed: UInt64(seed))
    }

    public func next() -> UInt64 {
        return (UInt64(distribution.nextInt()) << 48)
            | (UInt64(distribution.nextInt()) << 32)
            | (UInt64(distribution.nextInt()) << 16)
            | (UInt64(distribution.nextInt()) << 0)
    }
}
