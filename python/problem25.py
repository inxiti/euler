#!/usr/bin/env python3
#

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
