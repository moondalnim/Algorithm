struct K {
    static let maxTableSize = 10
}

struct Table {
    private var bucket: [Node<Int>?]

    init() {
        self.bucket = Array(repeating: nil, count: K.maxTableSize)
    }

    subscript(key: Int) -> Node<Int>? {
        get {
            self.bucket[key]
        }
        set {
            self.bucket[key] = newValue
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

func directAddressSearch(_ table: Table, _ key: Int) -> Node<Int>? {
    return table[key]
}

func directAddressInsert(_ table: inout Table, _ node: Node<Int>) {
    table[node.key] = node
}

func directAddressDelete(_ table: inout Table, _ node: Node<Int>) {
    table[node.key] = nil
}
