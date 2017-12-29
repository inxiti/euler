/*
 Problem 49
 
 The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases
 by 3330, is unusual in two ways: (i) each of the three terms are prime, and,
 (ii) each of the 4-digit numbers are permutations of one another.
 
 There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
 exhibiting this property, but there is one other 4-digit increasing sequence.
 
 What 12-digit number do you form by concatenating the three terms in this
 sequence?
 */

import Foundation

// generate list of primes up to limit
func primes(upTo limit: Int) -> [Int] {
    var primes: [Bool] = Array(repeating: true, count: limit)
    
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

// is `a` a permutation of `b`
func isPermutation(_ a: Int, of b: Int) -> Bool {
    return String(a).sorted() == String(b).sorted()
}

// find prime permutations up to `limit` that are increased by `difference`
func findPrimePermutations(upTo limit: Int, by difference: Int) -> String? {
    let ps = primes(upTo: limit).filter { $0 > 1_487 } // none with less than 4
                                                       // digits

    // search all primes under limit, and return the only other sequence that
    // matches the problem
    for p in ps {
        let b = p + difference
        let c = b + difference
        
        if ps.contains(b) && ps.contains(c) {
            if isPermutation(p, of: b) && isPermutation(b, of: c) {
                return "\(p)\(b)\(c)"
            }
        }
    }
    
    return nil
}

// benchmark
let limit = 10_000  // looking for four digit numbers
let difference = 3_330
let startTime = CFAbsoluteTimeGetCurrent()
let result = findPrimePermutations(upTo: limit, by: difference) ?? "not found"
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 296_962_999_629, result: \(result), elapsedTime: \(elapsedTime)")
