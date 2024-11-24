import unittest

from ds import SinglyLinkedList


class TestSinglyLinkedList(unittest.TestCase):
    def test(self):
        lst = SinglyLinkedList[int]()
        lst.append(5)
        lst.append(7)
        lst.append(9)
        self.assertEqual(lst.get(2), 9)
        self.assertEqual(lst.remove_at(1), 7)
        self.assertEqual(lst.length(), 2)

        lst.append(11)
        self.assertEqual(lst.remove_at(1), 9)
        with self.assertRaises(ValueError):
            lst.remove(9)
        self.assertEqual(lst.remove_at(0), 5)
        self.assertEqual(lst.remove_at(0), 11)
        self.assertEqual(lst.length(), 0)

        lst.prepend(5)
        lst.prepend(7)
        lst.prepend(9)
        self.assertEqual(lst.get(2), 5)
        self.assertEqual(lst.get(0), 9)
        self.assertEqual(lst.remove(9), 9)
        self.assertEqual(lst.length(), 2)
        self.assertEqual(lst.get(0), 7)
