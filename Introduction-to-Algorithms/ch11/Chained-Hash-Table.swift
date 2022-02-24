struct K {
    static let hashTableSize = 10
}

class Node {
    var key: Int
    var prev: Node?
    var next: Node?

    init(_ key: Int) {
        self.key = key
    }
}

struct LinkedList {
    var head: Node?

    mutating func insert(_ node: Node) {
        node.next = self.head

        if self.head != nil {
            self.head?.prev = node
        }

        self.head = node
        node.prev = nil
    }

    func search(_ key: Int) -> Node? {
        var node = self.head
        while node != nil, node?.key != key {
            node = node?.next
        }

        return node
    }

    mutating func delete(_ node: Node) {
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

struct HashTable {
    private var bucket: [Reference<LinkedList>?]

    init() {
        self.bucket = Array(repeating: nil, count: K.hashTableSize)
    }

    mutating func insert(_ node: Node) {
        if let reference = self.bucket[hashUsingMultiplication(node.key)] {
            reference.value.insert(node)
        } else {
            let reference: Reference<LinkedList> = Reference(LinkedList())
            self.bucket[hashUsingMultiplication(node.key)] = reference

            reference.value.insert(node)
        }
    }

    func search(_ key: Int) -> Node? {
        if let reference = self.bucket[hashUsingMultiplication(key)] {
            return reference.value.search(key)
        } else {
            return nil
        }
    }

    mutating func delete(_ node: Node) {
        if let reference = self.bucket[hashUsingMultiplication(node.key)] {
            reference.value.delete(node)
        } else {
            let reference: Reference<LinkedList> = Reference(LinkedList())
            self.bucket[hashUsingMultiplication(node.key)] = reference

            reference.value.delete(node)
        }
    }
}

func hashUsingMultiplication(_ key: Int) -> Int {
    let knuth = 0.6180339887

    return Int(Double(K.hashTableSize) * (Double(key) * knuth.truncatingRemainder(dividingBy: 1)))
}

func chainedHashInsert(_ hashTable: inout HashTable, _ node: Node) {
    hashTable.insert(node)
}

func chainedHashSearch(_ hashTable: HashTable, _ key: Int) -> Node? {
    hashTable.search(key)
}

func chainedHashDelete(_ hashTable: inout HashTable, _ node: Node) {
    hashTable.delete(node)
}
