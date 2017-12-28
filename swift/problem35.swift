/*
 Problem 35
 
 The number, 197, is called a circular prime because all rotations of the
 digits: 197, 971, and 719, are themselves prime.
 
 There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
 73, 79, and 97.
 
 How many circular primes are there below one million?
*/

import Foundation

// generate list of primes up to limit
func primes(upTo limit: Int) -> [Int] {
    var primes: [Bool] = Array(repeating: true, count: limit)
    
    // 0 and 1 are false, remove the 0th element
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

// rotate number given
func rotate(_ n: Int) -> Int {
    let product = Int(pow(10, Double(String(n).count - 1)))
    let head = n / product
    let tail = n % product

    return (tail * 10) + head
}

// return all rotations of number
func rotations(of n: Int) -> [Int] {
    var result: [Int] = [n]
    
    for _ in 0..<String(n).count - 1 {
        result.append(rotate(result.last!))
    }

    return result
}

// return all circular primes
func circularPrimes(under limit: Int) -> Set<Int> {
    let ps = Set<Int>(primes(upTo: limit)).filter { !String($0).contains("0") }

    var result: Set<Int> = []
    
    for p in ps {
        let rs = Set<Int>(rotations(of: p))
    
        if rs.isSubset(of: ps) { result.formUnion(rs) }
    }

    return result
}

// benchmark
let limit = 1_000_000
let startTime = CFAbsoluteTimeGetCurrent()
let result = circularPrimes(under: limit).count
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 55, result: \(result), elapsedTime: \(elapsedTime)")

// runs in 211ms
