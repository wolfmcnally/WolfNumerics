//
//  Interpolable.swift
//  WolfNumerics
//
//  Created by Wolf McNally on 9/6/18.
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

public protocol Interpolable {
    func interpolated(to other: Self, at frac: Frac) -> Self
}

extension Float: Interpolable {
    public func interpolated(to other: Float, at frac: Frac) -> Float {
        return Float(frac).lerpedFromFrac(to: self .. other)
    }
}

extension Double: Interpolable {
    public func interpolated(to other: Double, at frac: Frac) -> Double {
        return frac.lerpedFromFrac(to: self .. other)
    }
}

#if canImport(CoreGraphics)
import CoreGraphics
extension CGFloat: Interpolable {
    public func interpolated(to other: CGFloat, at frac: Frac) -> CGFloat {
        return CGFloat(frac).lerpedFromFrac(to: self .. other)
    }
}
#endif
