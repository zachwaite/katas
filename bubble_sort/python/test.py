import unittest

from algorithm import bubble_sort


class TestBubbleSort(unittest.TestCase):
    def test(self):
        arr = [9, 3, 7, 4, 69, 420, 42]
        bubble_sort(arr)
        expected = [3, 4, 7, 9, 42, 69, 420]
        self.assertListEqual(arr, expected)
