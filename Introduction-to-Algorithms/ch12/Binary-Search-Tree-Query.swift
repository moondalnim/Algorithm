class Node<Key: Comparable> {
    var key: Key
    var parent: Node?
    var left: Node?
    var right: Node?

    required init(_ key: Key) {
        self.key = key
    }
}

func treeSearch<Key: Comparable>(_ root: Node<Key>?, _ key: Key) -> Node<Key>? {
    guard let root = root, key != root.key else {
        return root
    }

    if key < root.key {
        return treeSearch(root.left, key)
    } else {
        return treeSearch(root.right, key)
    }
}

func inerativeTreeSearch<Key: Comparable>(_ root: Node<Key>?, _ key: Key) -> Node<Key>? {
    var node = root
    while let root = node, key != root.key {
        if key < root.key {
            node = root.left
        } else {
            node = root.right
        }
    }

    return node
}

func treeMinimum<Key: Comparable>(_ node: Node<Key>?) -> Node<Key>? {
    var node = node
    while node?.left != nil {
        node = node?.left
    }

    return node
}

func treeMaximum<Key: Comparable>(_ node: Node<Key>?) -> Node<Key>? {
    var node = node
    while node?.right != nil {
        node = node?.right
    }

    return node
}

func treeSuccessor<Key: Comparable>(_ node: Node<Key>?) -> Node<Key>? {
    if node?.right != nil {
        return treeMinimum(node?.right)
    }

    var node = node
    var parent = node?.parent
    while parent != nil, node === parent?.right {
        node = parent
        parent = parent?.parent
    }

    return parent
}

func treePresuccessor<Key: Comparable>(_ node: Node<Key>?) -> Node<Key>? {
    if node?.left != nil {
        return treeMaximum(node?.left)
    }

    var node = node
    var parent = node?.parent
    while parent != nil, node === parent?.left {
        node = parent
        parent = parent?.parent
    }

    return parent
}
