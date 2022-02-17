struct LinkedList<Key: Comparable> {
    var head: Node<Key>?
}

class Node<Key: Comparable> {
    var key: Key
    var prev: Node?
    var next: Node?

    init(_ key: Key) {
        self.key = key
    }
}

func listSearch<Key: Comparable>(_ linkedList: LinkedList<Key>, _ key: Key) -> Node<Key>? {
    var node = linkedList.head
    while node != nil, node?.key != key {
        node = node?.next
    }

    return node
}

func listInsert<Key: Comparable>(_ linkedList: inout LinkedList<Key>, _ node: Node<Key>) {
    node.next = linkedList.head

    if linkedList.head != nil {
        linkedList.head?.prev = node
    }

    linkedList.head = node
    node.prev = nil
}

func listDelete<Key: Comparable>(_ linkedList: inout LinkedList<Key>, _ node: Node<Key>) {
    if node.prev != nil {
        node.prev?.next = node.next
    } else {
        linkedList.head = node.next
    }

    if node.next != nil {
        node.next?.prev = node.prev
    }
}
