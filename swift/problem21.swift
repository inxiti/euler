/*
 Problem 21
 
 Let d(n) be defined as the sum of proper divisors of n (numbers less than n
 which divide evenly into n). If d(a) = b and d(b) = a, where a ≠ b, then a and
 b are an amicable pair and each of a and b are called amicable numbers.
 
 For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and
 142; so d(284) = 220.
 
 Evaluate the sum of all the amicable numbers under 10000.
 */

import Foundation

// sum proper divisors of n
func sumProperDivisors(of n: Int) -> Int {
    return (1..<n).filter { n % $0 == 0 }.reduce(0, +)
}

// find amicable numbers up to limit
func findAmicableNumbers(upTo limit: Int) -> [Int] {
    return (2..<limit).filter { i in
        let a = sumProperDivisors(of: i)
        let b = sumProperDivisors(of: a)
        
        return i == b && b != a
    }
}

// benchmark
let limit = 10_000
let startTime = CFAbsoluteTimeGetCurrent()
let result = findAmicableNumbers(upTo: limit).reduce(0, +)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected = 31_626, result = \(result), elapsedTime = \(elapsedTime)")

// runs in 
