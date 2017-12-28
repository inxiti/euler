/*
 Problem 4

 A palindromic number reads the same both ways. The largest palindrome made from
 the product of two 2-digit numbers is 9009 = 91 × 99.
 
 Find the largest palindrome made from the product of two 3-digit numbers.
*/

import Foundation

// check if number is a palindrome
func isPalindrome(_ number: Int) -> Bool {
    var result = number
    var reversedNumber = 0
    var remainder = 0
    
    while result > 0 {
        remainder = result % 10
        reversedNumber = reversedNumber * 10 + remainder
        result = result / 10
    }
    
    return number == reversedNumber
}

// find the largest palindrome up to limit
func findLargestPalindrome(upTo limit: Int) -> Int {
    var result = 0
    var number = 0
    
    for i in (1...limit).reversed() {
        for j in (i...limit).reversed() {
            number = i * j
            
            if number > result && isPalindrome(number) {
                result = number
            }
        }
    }
    
    return result
}

// benchmark
let limit = 1000
let startTime = CFAbsoluteTimeGetCurrent()
let result = findLargestPalindrome(upTo: limit)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 906_609, result: \(result), elapsedTime: \(elapsedTime)")

// runs in 0.4ms
