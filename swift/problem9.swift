/*
 Problem 9
 
 A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 a2 + b2 = c2
 
 For example, 32 + 42 = 9 + 16 = 25 = 52.
 
 There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 Find the product abc.
*/

import Foundation

/*
 euclid's formula via
 https://en.wikipedia.org/wiki/Pythagorean_triple#Generating_a_triple
 */
func findPythagoreanTriplet(limit: Int) -> Int {
    var (m, n) = (1, 2)
    var (a, b, c) = (0, 0, 0)
    
    while a + b + c != limit {
        (a, b, c) = (0, 0, 0)
        
        while m < n && a + b + c < limit {
            a = (n * n) - (m * m)
            b = 2 * m * n
            c = (n * n) + (m * m)
            m += 1
        }
        
        m = 1
        n += 1
    }
    
    return (a * b * c)
}

// benchmark
let limit = 1_000
let startTime = CFAbsoluteTimeGetCurrent()
let result = findPythagoreanTriplet(limit: limit)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 31_875_000, result: \(result), elapsedTime: \(elapsedTime)")

// runs in 0.001ms
