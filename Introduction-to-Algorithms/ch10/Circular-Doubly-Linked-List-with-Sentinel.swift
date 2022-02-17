struct LinkedList<Key: Comparable> {
    let `nil`: Node<Key>

    init() {
        self.nil = Node<Key>(nil)
        self.nil.prev = self.nil
        self.nil.next = self.nil
    }
}

class Node<Key: Comparable> {
    var key: Key?
    var prev: Node?
    var next: Node?

    init(_ key: Key?) {
        self.key = key
    }
}

func listSearch<Key: Comparable>(_ linkedList: LinkedList<Key>, _ key: Key) -> Node<Key>? {
    var node = linkedList.nil.next
    while node !== linkedList.nil && node?.key != key {
        node = node?.next
    }

    return node
}

func listInsert<Key: Comparable>(_ linkedList: inout LinkedList<Key>, _ node: Node<Key>) {
    node.next = linkedList.nil.next
    linkedList.nil.next?.prev = node
    linkedList.nil.next = node
    node.prev = linkedList.nil
}

func listDelete<Key: Comparable>(_ linkedList: inout LinkedList<Key>, _ node: Node<Key>) {
    node.prev?.next = node.next
    node.next?.prev = node.prev
}
