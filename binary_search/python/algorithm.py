"""Binary Search

Search by cutting the (sorted) search space in half progressively until you
find the value or the search space is 0. For each cut,
- if your value is at the midpoint, return
- if your value is bigger than the value at the midpoint, raise the floor
- if your value is smaller than the value at the midpoint, lower the ceiling
- Low is always exclusive, High is inclusive [L, H)
"""

import math


def binary_search(arr, val):
    lo = 0
    hi = len(arr)

    while True:
        mid = math.floor(lo + (hi - lo) / 2)

        if val == arr[mid]:
            return True
        elif val > arr[mid]:
            lo = mid + 1
        else:
            hi = mid

        if lo >= hi:
            break
    return False
