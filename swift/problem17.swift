/*
 Problem 17
 
 If the numbers 1 to 5 are written out in words: one, two, three, four, five,
 then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
 
 If all the numbers from 1 to 1000 (one thousand) inclusive were written out in
 words, how many letters would be used?
 
 NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
 forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
 letters. The use of "and" when writing out numbers is in compliance with
 British usage.
 */

import Foundation

// convert number to word
func convertNumberToWord(_ number: Int) -> String? {
    guard number <= 1_000 else { return nil }
    guard number != 1_000 else { return "onethousand" }

    var result = ""
    var rest = number

    if rest >= 100 {
        let h = rest / 100

        switch (h) {
        case 1: result += "one"
        case 2: result += "two"
        case 3: result += "three"
        case 4: result += "four"
        case 5: result += "five"
        case 6: result += "six"
        case 7: result += "seven"
        case 8: result += "eight"
        case 9: result += "nine"
        default: break
        }

        result += "hundred"

        if rest % 100 > 0 { result += "and" }

        rest = rest - (h * 100)
    }

    if rest >= 20 {
        let t = rest / 10

        switch (t) {
        case 2: result += "twenty"
        case 3: result += "thirty"
        case 4: result += "forty"
        case 5: result += "fifty"
        case 6: result += "sixty"
        case 7: result += "seventy"
        case 8: result += "eighty"
        case 9: result += "ninety"
        default: break
        }

        rest = rest - (t * 10)
    }

    if rest <= 20 {
        switch (rest) {
        case 1: result += "one"
        case 2: result += "two"
        case 3: result += "three"
        case 4: result += "four"
        case 5: result += "five"
        case 6: result += "six"
        case 7: result += "seven"
        case 8: result += "eight"
        case 9: result += "nine"
        case 10: result += "ten"
        case 11: result += "eleven"
        case 12: result += "twelve"
        case 13: result += "thirteen"
        case 14: result += "fourteen"
        case 15: result += "fifteen"
        case 16: result += "sixteen"
        case 17: result += "seventeen"
        case 18: result += "eighteen"
        case 19: result += "nineteen"
        default: break
        }
    }

    return result
}

// count letters in numbers up to a limit
func countLettersInNumbers(upTo limit: Int) -> Int {
    return (1...limit).flatMap {
        convertNumberToWord($0)?.count
    }.reduce(0, +)
}

// benchmark
let limit = 1000
let startTime = CFAbsoluteTimeGetCurrent()
let result = countLettersInNumbers(upTo: limit)
let elapsedTime = CFAbsoluteTimeGetCurrent() - startTime

print("expected: 21_124, result: \(result), elapsedTime: \(elapsedTime)")

// runs in 0.8ms
