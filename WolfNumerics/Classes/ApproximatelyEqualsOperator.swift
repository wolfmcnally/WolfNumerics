//
//  ApproximatelyEqualsOperator.swift
//  WolfNumerics
//
//  Created by Wolf McNally on 12/23/17.
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

///
/// Approximately-Equals-Operator
///
infix operator ≈ : ComparisonPrecedence

///
/// Not-Approximately-Equals-Operator
///
infix operator !≈ : ComparisonPrecedence

public func ≈<T: BinaryFloatingPoint>(lhs: T, rhs: (limit: T, tolerance: T)) -> Bool {
    return abs(lhs - rhs.limit) <= rhs.tolerance
}

public func ≈<T: BinaryFloatingPoint>(lhs: T, rhs: (limits: Interval<T>, tolerance: T)) -> Bool {
    return lhs ≈ (rhs.limits.a, rhs.tolerance) || lhs ≈ (rhs.limits.b, rhs.tolerance)
}

public func !≈<T: BinaryFloatingPoint>(lhs: T, rhs: (limits: Interval<T>, tolerance: T)) -> Bool {
    return !(lhs ≈ rhs)
}

public func !≈<T: BinaryFloatingPoint>(lhs: T, rhs: (limit: T, tolerance: T)) -> Bool {
    return !(lhs ≈ rhs)
}
