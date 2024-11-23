import unittest

from algorithm import binary_search


class TestBinarySearch(unittest.TestCase):
    def test(self):
        arr = [1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420]
        self.assertTrue(binary_search(arr, 69))
        self.assertFalse(binary_search(arr, 1336))
        self.assertTrue(binary_search(arr, 69420))
        self.assertFalse(binary_search(arr, 69421))
        self.assertTrue(binary_search(arr, 1))
        self.assertFalse(binary_search(arr, 0))
