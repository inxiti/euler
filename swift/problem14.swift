/*
 Problem 14
 
 The following iterative sequence is defined for the set of positive integers:
 
 n → n/2 (n is even)
 n → 3n + 1 (n is odd)
 
 Using the rule above and starting with 13, we generate the following sequence:
 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 
 It can be seen that this sequence (starting at 13 and finishing at 1) contains
 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
 that all starting numbers finish at 1.
 
 Which starting number, under one million, produces the longest chain?
 
 NOTE: Once the chain starts the terms are allowed to go above one million.
*/

import Foundation

var counts: [Int] = [1]

// collatz sequence count of n
func collatzSequenceCount(of n: Int) -> Int {
    guard counts.count < n else { return counts[n - 1] }

    return 1 + collatzSequenceCount(of: n % 2 == 0 ? n / 2 : 3 * n + 1)
}

// find largest collatz sequence under limit
func findLargestCollatzSequence(under limit: Int) -> Int {
    for i in 2..<limit {
        counts.append(collatzSequenceCount(of: i))
    }
    
    // return its index
    return counts.index(of: counts.max()!)!+1
}

// benchmark
let limit = 1_000_000
let startTime = CFAbsoluteTimeGetCurrent()
let result = findLargestCollatzSequence(under: limit)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 837_799, result: \(result), elapsedTime: \(elapsedTime)")

// runs in 26ms
