/*
 Problem 3

 The prime factors of 13195 are 5, 7, 13 and 29.
 
 What is the largest prime factor of the number 600851475143 ?
*/

import Foundation

func nextPrime(after n: Int = 1) -> Int {
    var max = n + 1
    
    while true {
        for i in 2...max {
            if i == max { return i }
            if max % i == 0 {
                max += 1
                break
            }
        }
    }
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
          
        prime = nextPrime(after: prime)
        
        if number % prime == 0 {
            result.append(prime)
            number /= prime
        }
    }
    
    return result
}

// benchmark
let number = 600_851_475_143
let startTime = CFAbsoluteTimeGetCurrent()
let result = primeFactors(of: number)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: [71, 839, 1471, 6857], result: \(result), elapsedTime: \(elapsedTime)")

// runs in 17ms
