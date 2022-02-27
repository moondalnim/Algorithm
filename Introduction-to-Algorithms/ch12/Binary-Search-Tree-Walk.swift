class Node<Key: Comparable> {
    var key: Key
    var parent: Node?
    var left: Node?
    var right: Node?

    required init(_ key: Key) {
        self.key = key
    }
}

func inorderTreeWalk<Key: Comparable>(_ root: Node<Key>?) {
    if root != nil {
        inorderTreeWalk(root?.left)
        print(root?.key as Any)
        inorderTreeWalk(root?.right)
    }
}

func preorderTreeWalk<Key: Comparable>(_ root: Node<Key>?) {
    if root != nil {
        print(root?.key as Any)
        preorderTreeWalk(root?.left)
        preorderTreeWalk(root?.right)
    }
}

func postorderTreeWalk<Key: Comparable>(_ root: Node<Key>?) {
    if root != nil {
        postorderTreeWalk(root?.left)
        postorderTreeWalk(root?.right)
        print(root?.key as Any)
    }
}
