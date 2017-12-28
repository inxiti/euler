#!/usr/bin/env python3
#

import time

# find distinct terms up to limit
def findDistinctTerms(limit):
    result = set()

    for i in range(2, limit):
        for j in range(2, limit):
            result.add(i ** j)

    return result

# begin benchmarking of finding the result
limit = 101
startTime = time.time()
result = len(findDistinctTerms(limit))
elapsedTime = time.time() - startTime

# print results and how much time elapsed
print("expected: 9_183, result: {:_}, elapsedTime: {}s".format(result, elapsedTime))

# runs in 6ms
