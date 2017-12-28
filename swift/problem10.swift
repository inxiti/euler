/*
 Problem 10

 The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 
 Find the sum of all the primes below two million.
*/

import Foundation

// sieve of eratosthenes
func findPrimes(upTo number: Int) -> [Int] {
    var primes: [Bool] = Array(repeating: true, count: number)
    
    // 0 and 1 are false
    primes[0] = false
    primes[1] = false
    
    for i in 2..<primes.count where primes[i] {
        for j in 2..<primes.count {
            let ij = i * j
            
            if ij < primes.count {
                primes[ij] = false
            } else {
                break
            }
        }
    }

    return primes.enumerated().flatMap { $1 ? $0 : nil }
}

// benchmark
let limit = 2_000_000
let startTime = CFAbsoluteTimeGetCurrent()
let result = findPrimes(upTo: limit).reduce(0, +)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 142_913_828_922, result: \(result), elapsedTime: \(elapsedTime)")

// runs in 13ms
