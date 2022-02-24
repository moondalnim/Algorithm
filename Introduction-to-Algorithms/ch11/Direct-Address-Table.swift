struct K {
    static let maxTableSize = 10
}

struct Table {
    private var bucket: [Node?]

    init() {
        self.bucket = Array(repeating: nil, count: K.maxTableSize)
    }

    subscript(key: Int) -> Node? {
        get {
            self.bucket[key]
        }
        set {
            self.bucket[key] = newValue
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

func directAddressSearch(_ table: Table, _ key: Int) -> Node? {
    return table[key]
}

func directAddressInsert(_ table: inout Table, _ node: Node) {
    table[node.key] = node
}

func directAddressDelete(_ table: inout Table, _ node: Node) {
    table[node.key] = nil
}
