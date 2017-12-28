/*
 Problem 7
 
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 
 What is the 10 001st prime number?
*/

import Foundation

/*
 used to help approximate how many elements for array to be filtered via sieve of eratosthenes
 
 formula: n log n + n(log log n - 0.9385)
 source: https://www.maa.org/sites/default/files/jaroma03200545640.pdf
 */
func approxPrime(nth position: Int) -> Int {
    let n = Double(position)
    
    return Int((n * log(n) + (n * (log(log(n - 0.9385))))).rounded())
}

// find primes under approximatePrime
func findPrimes(under approximatePrime: Int) -> [Int] {
    var primes: [Bool] = Array(repeating: true, count: approximatePrime)
    
    // 0 and 1 are false, remove the 0th element
    primes[0] = false
    primes[1] = false
    primes.remove(at: 0)
    
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

// finds the nth prime
func findNthPrime(at position: Int) -> Int {
    return findPrimes(under: approxPrime(nth: position))[position]
}

// benchmark
let position = 10_001
let startTime = CFAbsoluteTimeGetCurrent()
let result = findNthPrime(at: position)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 104_743, result: \(result), elapsedTime: \(elapsedTime)")

// runs in 0.7ms
