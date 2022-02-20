struct K {
    static let hashTableSize = 10
}

class Node<Key: Hashable> {
    var key: Key
    var prev: Node<Key>?
    var next: Node<Key>?

    init(_ key: Key) {
        self.key = key
    }
}

struct LinkedList<Key: Hashable> {
    var head: Node<Key>?

    mutating func insert(_ node: Node<Key>) {
        node.next = self.head

        if self.head != nil {
            self.head?.prev = node
        }

        self.head = node
        node.prev = nil
    }

    func search(_ key: Key) -> Node<Key>? {
        var node = self.head
        while node != nil, node?.key != key {
            node = node?.next
        }

        return node
    }

    mutating func delete(_ node: Node<Key>) {
        if node.prev != nil {
            node.prev?.next = node.next
        } else {
            self.head = node.next
        }

        if node.next != nil {
            node.next?.prev = node.prev
        }
    }
}

final class Reference<Value> {
    var value: Value

    init(_ value: Value) {
        self.value = value
    }
}

struct HashTable<Key: Hashable> {
    private var bucket: [Reference<LinkedList<Key>>?]

    init() {
        self.bucket = Array(repeating: nil, count: K.hashTableSize)
    }

    mutating func insert(_ node: Node<Key>) {
        if let reference = self.bucket[hash(node.key)] {
            reference.value.insert(node)
        } else {
            let reference: Reference<LinkedList<Key>> = Reference(LinkedList())
            self.bucket[hash(node.key)] = reference

            reference.value.insert(node)
        }
    }

    func search(_ key: Key) -> Node<Key>? {
        if let reference = self.bucket[hash(key)] {
            return reference.value.search(key)
        } else {
            return nil
        }
    }

    mutating func delete(_ node: Node<Key>) {
        if let reference = self.bucket[hash(node.key)] {
            reference.value.delete(node)
        } else {
            let reference: Reference<LinkedList<Key>> = Reference(LinkedList())
            self.bucket[hash(node.key)] = reference

            reference.value.delete(node)
        }
    }

    private func hash<Key: Hashable>(_ key: Key) -> Int {
        return abs(key.hashValue % K.hashTableSize)
    }
}

func chainedHashInsert<Key: Hashable>(_ hashTable: inout HashTable<Key>, _ node: Node<Key>) {
    hashTable.insert(node)
}

func chainedHashSearch<Key: Hashable>(_ hashTable: HashTable<Key>, _ key: Key) -> Node<Key>? {
    hashTable.search(key)
}

func chainedHashDelete<Key: Hashable>(_ hashTable: inout HashTable<Key>, _ node: Node<Key>) {
    hashTable.delete(node)
}
