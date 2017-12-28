/*
 Problem 6

 The sum of the squares of the first ten natural numbers is,
 12 + 22 + ... + 102 = 385
 
 The square of the sum of the first ten natural numbers is,
 (1 + 2 + ... + 10)2 = 552 = 3025
 
 Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
 
 Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*/

import Foundation

func sumSquareDifference(upTo limit: Int) -> Int {
    let numbers = 1...limit
    let sumOfNumbers = numbers.reduce(0, +)
    let sumOfSquares = numbers.map { $0 * $0 }.reduce(0, +)
    
    return (sumOfNumbers * sumOfNumbers) - sumOfSquares
}

// benchmark
let limit = 100
let startTime = CFAbsoluteTimeGetCurrent()
let result = sumSquareDifference(upTo: limit)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 25_164_150, result: \(result), elapsedTime: \(elapsedTime)")

// runs in 0.16ms
