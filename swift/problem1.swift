/*
 Problem 1

 If we list all the natural numbers below 10 that are multiples of 3 or 5, we
 get 3, 5, 6 and 9. The sum of these multiples is 23.
 
 Find the sum of all the multiples of 3 or 5 below 1000.

 */

import Foundation

// sum all multiples of given numbers up to max
func sumMultiples(for numbers: [Int], upTo max: Int ) -> Int {
    guard numbers.count > 0 && numbers.min()! < max else { return 0 }

    var multiples: Set<Int> = []

    for n in numbers {
        for i in numbers.min()!..<max {
            if i % n == 0 { multiples.insert(i) }
        }
    }

    return multiples.reduce(0, +)
}

// benchmark
let numbers = [3, 5]
let limit = 1_000
let startTime = CFAbsoluteTimeGetCurrent()
let result = sumMultiples(for: numbers, upTo: limit)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 233_168, result: \(result), elapsedTime: \(elapsedTime)")

// runs in 0.066ms
