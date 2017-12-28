#!/usr/bin/env python3
#

# Problem 25
#
# The Fibonacci sequence is defined by the recurrence relation:
#
#     Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
#
# Hence the first 12 terms will be:
#
#     F1 = 1
#     F2 = 1
#     F3 = 2
#     F4 = 3
#     F5 = 5
#     F6 = 8
#     F7 = 13
#     F8 = 21
#     F9 = 34
#     F10 = 55
#     F11 = 89
#     F12 = 144
#
# The 12th term, F12, is the first term to contain three digits.
#
# What is the index of the first term in the Fibonacci sequence to contain 1000
# digits?

import time

# generate fibonacci numbers
def generateFibonacciNumber():
    a, b = 0, 1

    while True:
        b, a = a + b, b

        yield b

# find index of fibonacci number greater than limit
def findIndexOfFibonacciNumberGreaterThan(limit):
    result = 2

    for number in generateFibonacciNumber():
        if len(str(number)) < limit:
            result += 1
        else:
            break

    return result

# benchmark
limit = 1_000
startTime = time.time()
result = findIndexOfFibonacciNumberGreaterThan(limit)
elapsedTime = time.time() - startTime

# print results and how much time elapsed
print("expected: 4_782, result: {:_}, elapsedTime: {}s"
    .format(result, elapsedTime))

# runs in 19ms
