from dataclasses import dataclass
from typing import Generic, TypeVar

T = TypeVar("T")


@dataclass
class Node(Generic[T]):
    value: T
    prev: "MaybeNode"


MaybeNode = Node[T] | None
MaybeT = T | None


class Stack(Generic[T]):
    _head: MaybeNode
    _length: int

    def __init__(self) -> None:
        self._head = None
        self._length = 0

    @property
    def head(self) -> MaybeNode:
        return self._head

    @property
    def length(self) -> int:
        return self._length

    def push(self, value: T) -> None:
        oldhead = self._head
        newhead = Node(value=value, prev=oldhead)
        self._head = newhead
        self._length += 1

    def pop(self) -> MaybeT:
        if self.length == 0:
            return None
        elif self.length == 1:
            out = self.head.value  # type: ignore
            self._head = None
            self._length -= 1
            return out
        else:
            out = self.head.value  # type: ignore
            self._head = self._head.prev  # type: ignore
            self._length -= 1
            return out

    def peek(self) -> MaybeT:
        if self.length == 0:
            return None
        else:
            return self.head.value  # type: ignore
