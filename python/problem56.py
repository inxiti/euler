#!/usr/bin/env python3
#

# Problem 56
#
# A googol (10^100) is a massive number: one followed by one-hundred zeros;
# 100^100 is almost unimaginably large: one followed by two-hundred zeros.
# Despite their size, the sum of the digits in each number is only 1.
#
# Considering natural numbers of the form, a^b, where a, b < 100, what is the
# maximum digital sum?

import time

# return a list of all self powers up to limit
def selfPowers(limit):
    return [i ** j for i in range(1, limit) for j in range(1, limit)]

# returns a list of the sums of numbers in `listOfNumbers`
def sumsOfNumbers(listOfNumbers):
    return map(lambda number: sum(map(int, str(number))), listOfNumbers)

# benchmark
limit = 100
startTime = time.time()
sp = selfPowers(limit)
result = max(sumsOfNumbers(sp))
elapsedTime = time.time() - startTime

print("expected: 972, result: {}, elapsedTime: {}s".format(result, elapsedTime))

# runs in 103ms
