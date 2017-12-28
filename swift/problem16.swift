/*
 Problem 16
 
 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 
 What is the sum of the digits of the number 21000?
 */

import Foundation

// power of n to exponent
func powerOf(_ n: Int, to exponent: Int) -> [Int] {
    guard exponent >= 2 else { return [n] }
    
    var result = [n]
    
    for _ in 2...exponent {
        var temp: [Int] = []
        var carry = 0
        
        for i in result {
            let number = i * n + carry
            
            temp.append(number % 10)
            carry = number / 10
        }
        
        if carry > 0 { temp.append(carry) }
        
        result = temp
    }
    
    return result.reversed()
}

// benchmark and print results
let number = 2
let limit = 1_000
let startTime = CFAbsoluteTimeGetCurrent()
let result = powerOf(number, to: limit).reduce(0, +)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 1_366, result: \(result), elapsedTime: \(elapsedTime)")

// runs in 1.6ms
