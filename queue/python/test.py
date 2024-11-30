import unittest

from ds import Queue


class TestQueue(unittest.TestCase):
    def test(self):
        lst = Queue[int]()
        lst.enqueue(5)
        lst.enqueue(7)
        lst.enqueue(9)

        self.assertEqual(lst.dequeue(), 5)
        self.assertEqual(lst.length, 2)

        lst.enqueue(11)
        self.assertEqual(lst.dequeue(), 7)
        self.assertEqual(lst.dequeue(), 9)
        self.assertEqual(lst.peek(), 11)
        self.assertEqual(lst.dequeue(), 11)
        self.assertEqual(lst.dequeue(), None)
        self.assertEqual(lst.length, 0)

        lst.enqueue(69)
        self.assertEqual(lst.peek(), 69)
        self.assertEqual(lst.length, 1)
