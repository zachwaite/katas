import unittest

from ds import Stack


class TestStack(unittest.TestCase):
    def test(self):
        stk = Stack[int]()
        stk.push(5)
        stk.push(7)
        stk.push(9)

        self.assertEqual(stk.pop(), 9)
        self.assertEqual(stk.length, 2)

        stk.push(11)
        self.assertEqual(stk.pop(), 11)
        self.assertEqual(stk.pop(), 7)
        self.assertEqual(stk.peek(), 5)
        self.assertEqual(stk.pop(), 5)

        stk.push(69)
        self.assertEqual(stk.peek(), 69)
        self.assertEqual(stk.length, 1)
        self.assertEqual(stk.pop(), 69)
        self.assertEqual(stk.length, 0)
        self.assertEqual(stk.pop(), None)
        self.assertEqual(stk.length, 0)
