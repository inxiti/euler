/*
 Problem 5

 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
 
 What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 */

import Foundation

// returns the next prime after n
func nextPrime(upTo limit: Int, after n: Int = 1) -> Int? {
    guard n < limit else { return nil }
    
    // find the next prime available
    for i in (n + 1)...limit {
        for j in 2...limit {
            if i == j { return i }
            if i % j == 0 {
                break
            }
        }
    }
    
    // if no prime found between `n` and `limit`, return nil
    return nil
}

// generate prime factors of a number
func primeFactors(of n: Int) -> [Int]  {
    guard n > 0 else { return [] }
    guard n != 1 else { return [1] }
    
    var prime = 2
    var number = n
    var result: [Int] = []
    
    // start generating prime numbers and finding prime factors for `n`
    while number != 1 {
        if number % prime == 0 {
            number /= prime
            result.append(prime)
            continue
        }
        
        if let p = nextPrime(upTo: n, after: prime) {
            prime = p
            
            if number % prime == 0 {
                result.append(prime)
                number /= prime
            }
        }
    }
    
    return result
}

// find smallest number divisible by all numbers up to limit
func smallestNumberDivisibleByAll(upTo limit: Int) -> Int {
    var result: [Int] = []
    
    for i in 2...limit {
        let factors = primeFactors(of: i)
        
        for f in factors {
            let differences = (factors.filter { $0 == f }.count)
                - (result.filter { $0 == f }.count)

            if differences > 0 {
                for _ in 1...differences {
                    result.append(f)
                }
            }
        }
    }
    
    return result.reduce(1, *)
}

// benchmark
let limit = 20
let startTime = CFAbsoluteTimeGetCurrent()
let result = smallestNumberDivisibleByAll(upTo: limit)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 232_792_560, result: \(result), elapsedTime: \(elapsedTime)")

// runs in 0.19ms
