#!/usr/bin/env python3
#

# Problem 48
#
# The series, 11 + 22 + 33 + ... + 1010 = 10405071317.
#
# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

import time
from functools import reduce

# add all self powers up to limit, and return the last n digits
def addSelfPowers(limit, n):
    return str(reduce(lambda i, j: i + (j ** j), range(1, limit + 1)))[n:]

# benchmark
beginIndex = -10
limit = 1_000
startTime = time.time()
result = addSelfPowers(limit, beginIndex)
elapsedTime = time.time() - startTime

print("expected: 9_110_846_700, result: {:_}, elapsedTime: {}s"
    .format(int(result), elapsedTime))

# runs in 6ms(0.006s)
