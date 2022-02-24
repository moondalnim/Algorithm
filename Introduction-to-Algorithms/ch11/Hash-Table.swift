struct K {
    static let hashTableSize = 10
}

struct HashTable {
    private var bucket: [Node?]

    init() {
        self.bucket = Array(repeating: nil, count: K.hashTableSize)
    }

    subscript(hashValue: Int) -> Node? {
        get {
            self.bucket[hashValue]
        }
        set {
            self.bucket[hashValue] = newValue
        }
    }
}

class Node {
    var key: Int
    var value: Any?

    init(_ key: Int, _ value: Any? = nil) {
        self.key = key
        self.value = value
    }
}

func hashUsingDivision(_ key: Int) -> Int {
    return key % K.hashTableSize
}

func hashSearch(_ hashTable: HashTable, _ key: Int) -> Node? {
    hashTable[hashUsingDivision(key)]
}

func hashInsert(_ hashTable: inout HashTable, _ node: Node) {
    hashTable[hashUsingDivision(node.key)] = node
}

func hashDelete(_ hashTable: inout HashTable, _ node: Node) {
    hashTable[hashUsingDivision(node.key)] = nil
}
