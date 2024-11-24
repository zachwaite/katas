"""SinglyLinkedList
Running time for get operations is O(N)
Running time for append, prepend is O(1)
Running time for remove, remove_at is effectively O(N) because the get traversal happens
"""

from typing import Generic, Optional, TypeVar

T = TypeVar("T")


class Node(Generic[T]):
    _value: T
    _next: "Optional[Node[T]]"

    def __init__(self, value: T, next: "Optional[Node[T]]" = None) -> None:
        self._value = value
        self._next = next

    @property
    def value(self) -> T:
        return self._value

    @value.setter
    def value(self, v: T) -> None:
        self._value = v

    @property
    def next(self) -> "Optional[Node[T]]":
        return self._next

    @next.setter
    def next(self, v: "Node[T]") -> None:
        self._next = v


class SinglyLinkedList(Generic[T]):
    """Stores a reference to the head node
    and provides the methods needed to work with the list.
    """

    def __init__(self) -> None:
        self._head: Optional[Node[T]] = None

    def __str__(self) -> str:
        vals = []
        node = self.head
        while node:
            vals.append(node.value)
            node = node.next
        return "->".join([str(v) for v in vals])

    @property
    def head(self) -> Optional[Node[T]]:
        return self._head

    @head.setter
    def head(self, value: Optional[Node[T]]) -> None:
        self._head = value

    @property
    def tail(self) -> Optional[Node[T]]:
        if not self.head:
            return None
        else:
            node = self.head
            while node.next:
                node = node.next
            return node

    def length(self) -> int:
        """Return the length of the list
        Args:
            None

        Returns:
            The integer length of the list
        """
        node = self.head
        count = 0
        while node:
            node = node.next
            count += 1
        return count

    def get(self, idx: int) -> T:
        """Get the value of the node at the specified index.

        Args:
            idx (int) The index of the node you're seeking a value for
        Returns:
            The value of the node at the index
        Raises
            IndexError if attempting to access an index that doesn't exist
        """

        node = self.head
        i = 0
        while i < idx:
            if not node:
                msg = f"Node at index {i} not found when seeking node at index {idx}"
                raise IndexError(msg)

            if node.next:
                node = node.next
                i += 1

        if not node:
            msg = f"Node at index {i} not found when seeking node at index {idx}"
            raise IndexError(msg)
        return node.value

    def remove(self, value: T) -> T:
        """Remove the first node which has the provided value
        Args:
            value (T) The value you're searching for
        Returns:
            The value of the node you found. Should be the same you passed in
        Raises:
            ValueError if no node is found with the provided value
        """
        parent_node = None
        node = self.head
        while node:
            if value == node.value:
                if not parent_node and node:
                    out = node.value
                    self.head = node.next
                    return out
                elif parent_node and node:
                    out = node.value
                    parent_node.next = node.next  # type: ignore None check in elif
                    return out
                else:
                    msg = f"Unreachable: we can never have a parent_node without child"
                    raise NotImplementedError(msg)
            else:
                parent_node = node
                node = node.next
        msg = f"The value {value} was not found in the list"
        raise ValueError(msg)

    def remove_at(self, idx: int) -> T:
        """Remove the node at the specified index
        Args:
            idx (int) The index of the node you'd like to remove

        Returns:
            The value of the node at the index you just removed

        Raises:
            IndexError if the index doesn't exist
        """
        parent_node = None
        node = self.head
        i = 0
        while i < idx:
            if not node:
                msg = f"Node at index {i} not found when seeking node at index {idx}"
                raise IndexError(msg)

            if node.next:
                parent_node = node
                node = node.next
                i += 1

        if node and not parent_node:
            assert i == 0
            out = self.head.value  # type: ignore - the None check is in the if
            self.head = node.next
            return out
        elif node and parent_node:
            next_node = node.next
            parent_node.next = next_node  # type: ignore - the None check is in the elif
            out = node.value
            return out
        else:
            msg = f"Unreachable: we can never have a parent_node without child"
            raise NotImplementedError(msg)

    def append(self, value: T) -> None:
        """Add a new node to the end of the list

        Args:
            value (T) The value you want to append
        Returns:
            None
        Raises:
            AssertionError if the existing last node already has a next node
        """

        new_node = Node(value)
        if not self.head:
            self.head = new_node
            return None
        else:
            assert self.tail != None
            assert self.tail.next == None
            self.tail.next = new_node

    def prepend(self, value: T) -> None:
        """Add a new node to the beginning of the list
        Args:
            value (T) The value to prepend
        Returns:
            None
        """
        new_node = Node(value)
        if self.head:
            new_node.next = self.head
        self.head = new_node
