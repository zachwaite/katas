import math
import random
import unittest

from algorithm import two_crystal_balls


class Test2CrystalBalls(unittest.TestCase):
    def test1(self):
        idx = math.floor(random.random() * 10000)
        data = [False for _ in range(10000)]
        for i in range(10000):
            if i >= idx:
                data[i] = True
        expected = idx
        observed = two_crystal_balls(data)
        self.assertEqual(observed, expected)

    def test2(self):
        self.assertEqual(two_crystal_balls([False for _ in range(821)]), -1)
