struct K {
    static let hashTableSize = 10
}

struct HashTable<Key: Hashable> {
    private var bucket: [Node<Key>?]

    init() {
        self.bucket = Array(repeating: nil, count: K.hashTableSize)
    }

    subscript(hashValue: Int) -> Node<Key>? {
        get {
            self.bucket[hashValue]
        }
        set {
            self.bucket[hashValue] = newValue
        }
    }
}

class Node<Key: Hashable> {
    var key: Key
    var value: Any?

    init(_ key: Key, _ value: Any? = nil) {
        self.key = key
        self.value = value
    }
}

func hash<Key: Hashable>(_ key: Key) -> Int {
    return abs(key.hashValue % K.hashTableSize)
}

func hashSearch<Key: Hashable>(_ hashTable: HashTable<Key>, _ key: Key) -> Node<Key>? {
    hashTable[hash(key)]
}

func hashInsert<Key: Hashable>(_ hashTable: inout HashTable<Key>, _ node: Node<Key>) {
    hashTable[hash(node.key)] = node
}

func hashDelete<Key: Hashable>(_ hashTable: inout HashTable<Key>, _ node: Node<Key>) {
    hashTable[hash(node.key)] = nil
}
