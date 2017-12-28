/*
 Problem 23
 
 A perfect number is a number for which the sum of its proper divisors is
 exactly equal to the number. For example, the sum of the proper divisors of 28
 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
 
 A number n is called deficient if the sum of its proper divisors is less than n
 and it is called abundant if this sum exceeds n.
 
 As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
 number that can be written as the sum of two abundant numbers is 24. By
 mathematical analysis, it can be shown that all integers greater than 28123 can
 be written as the sum of two abundant numbers. However, this upper limit cannot
 be reduced any further by analysis even though it is known that the greatest
 number that cannot be expressed as the sum of two abundant numbers is less than
 this limit.
 
 Find the sum of all the positive integers which cannot be written as the sum of
 two abundant numbers.
*/

import Foundation

// proper divisors of n
func properDivisors(of n: Int) -> [Int] {
    return (1..<n).filter { n % $0 == 0 }
}

// abundant numbers up to limit
func abundantNumbers(upTo limit: Int) -> [Int] {
    return (1..<limit).flatMap { i in
        properDivisors(of: i).reduce(0, +) > i ? i : nil
    }
}

// non abundant numbers up to limit
func nonAdundantNumbers(upTo limit: Int) -> [Int] {
    let abundants = abundantNumbers(upTo: limit)

    var result = Array(0...limit)
    
    for i in abundants {
        for j in abundants {
            if i + j >= result.count { break }
            
            result[i+j] = 0
        }
    }
    
    return result.filter { $0 != 0 }
}

// benchmark
let limit = 28123
let startTime = CFAbsoluteTimeGetCurrent()
let result = nonAdundantNumbers(upTo: limit).reduce(0, +)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 4_179_871, result: \(result), elapsedTime: \(elapsedTime)")

// runs in 2.5s
