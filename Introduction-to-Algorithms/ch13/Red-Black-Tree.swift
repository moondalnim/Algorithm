enum Color {
    case red
    case black
}

struct RedBlackTree<Key: Comparable> {
    var root: Node<Key>?
    var sentinel = Node<Key>(nil)

    init(_ root: Node<Key>? = nil) {
        self.root = root
    }
}

class Node<Key: Comparable> {
    var parent: Node?
    var left: Node?
    var right: Node?

    var color: Color = .black
    var key: Key?

    required init(_ key: Key?) {
        self.key = key
    }
}
