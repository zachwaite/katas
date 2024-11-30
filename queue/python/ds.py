"""Queue implementation

A queue is a singly linked list with constraints to provide a first-in-first-out (FIFO)
storage mechanism.

References to the head and tail nodes are maintained to avoid any traversals and allow
for constant time operations.
"""

from dataclasses import dataclass
from typing import Generic, TypeVar

T = TypeVar("T")


@dataclass
class Node(Generic[T]):
    value: T
    next: "MaybeNode"


MaybeNode = Node[T] | None
MaybeT = T | None


class Queue(Generic[T]):
    _head: MaybeNode
    _tail: MaybeNode
    _length: int

    @property
    def head(self) -> MaybeNode:
        return self._head

    @property
    def tail(self) -> MaybeNode:
        return self._tail

    @property
    def length(self):
        return self._length

    def __str__(self) -> str:
        out = []
        node = self.head
        while node:
            out.append(node.value)
            node = node.next
        return "->".join([str(x) for x in out])

    def __init__(self) -> None:
        self._head = None
        self._tail = None
        self._length = 0

    def enqueue(self, value: T) -> None:
        """Add a value to the end of the list - O(1)
        Args:
            value (T) The value of the node to insert
        Returns:
            None
        """
        newnode = Node(value=value, next=None)
        oldtail = self.tail
        oldhead = self.head
        oldlength = self.length
        if oldhead and oldtail:
            assert oldlength > 1
            oldtail.next = newnode
            self._tail = newnode
        elif oldhead and not oldtail:
            assert oldlength == 1
            self._head.next = newnode  # type: ignore checked in elif
            self._tail = newnode
        elif not oldhead and not oldtail:
            assert oldlength == 0
            self._head = newnode
        else:
            raise NotImplementedError("UNREACHABLE")
        self._length += 1

    def dequeue(self) -> MaybeT:
        """Remove a value from the front of the list - O(1)
        Returns:
            The value of the first item in the list or None
        """
        oldhead = self.head
        oldtail = self.tail
        oldlength = self.length
        if oldhead and oldtail and oldlength > 2:
            self._head = oldhead.next
            self._length -= 1
            return oldhead.value
        elif oldhead and oldtail and oldlength == 2:
            self._head = oldhead.next
            self._tail = None
            self._length -= 1
            return oldhead.value
        elif oldhead and not oldtail and oldlength == 1:
            self._head = None
            self._length = 0
            return oldhead.value
        elif not oldhead and not oldtail and oldlength == 0:
            return None
        else:
            raise NotImplementedError("UNREACHABLE")

    def peek(self) -> MaybeT:
        """Get the value from the front of the list without removing - O(1)
        Returns:
            The value of the first item in the list or None
        """
        if self.head:
            return self.head.value
        else:
            return None
