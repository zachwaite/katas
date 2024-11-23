"""
The two two_crystal_balls problem is like this:
You have two crystal balls. A crystal ball will break if dropped from above
a specific height, but will not below that height, regardless of how many times
you drop it. You are told to find the threshold height where the balls break.
The heights are often framed as floors in a building. You start from the ground
floor and work your way up.

A naive way to solve this problem is to treat it like binary search and jump to the
midpoint until a break, then go back to the last success and walk forward. This however
has O(N) running time because you ultimately end up doing a linear search for some
portion of the array. However if you jump by a nonlinear amount, the square root,
the running time becomes O(log(N)) because the most you ever have to walk is square root
of the length of the array.
"""

import math


def two_crystal_balls(arr: list[bool]) -> int:
    """Finds the first index (building floor) in the array where the ball
    breaks or return -1 if it never breaks. You can break 2 balls.
    """
    # since python doesn't easily support reusing i outside the for loop, we drop to a
    # while loop in the "do while" style
    jump_amount = math.floor(math.sqrt(len(arr)))
    i = jump_amount
    while True:
        # if we find the first break, stop jumping and store the index.
        # we will then jump back to the last success and walk forward until the next break
        if arr[i]:
            break
        else:
            i += jump_amount

        if i >= len(arr):
            # we can return early since this array is sorted and we got at least to the end
            return -1

    # If we had a ball break, go back to the last known ok or 0 and start walking
    # forward until it breaks again
    i -= jump_amount
    jump_amount = 1
    while True:
        if arr[i]:
            break
        else:
            i += jump_amount
    return i
