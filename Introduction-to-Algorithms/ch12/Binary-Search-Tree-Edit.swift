struct BinarySearchTree<Key: Comparable> {
    var root: Node<Key>?

    init(_ root: Node<Key>? = nil) {
        self.root = root
    }
}

class Node<Key: Comparable> {
    var key: Key
    var parent: Node?
    var left: Node?
    var right: Node?

    required init(_ key: Key) {
        self.key = key
    }
}

func treeMinimum<Key: Comparable>(_ node: Node<Key>?) -> Node<Key>? {
    var node = node
    while node?.left != nil {
        node = node?.left
    }

    return node
}

func treeInsert<Key: Comparable>(_ binarySearchTree: inout BinarySearchTree<Key>, _ node: Node<Key>) {
    var parent: Node<Key>? = nil
    var root = binarySearchTree.root

    while root != nil {
        parent = root
        if node.key < root!.key {
            root = root?.left
        } else {
            root = root?.right
        }
    }

    node.parent = parent
    if parent == nil {
        binarySearchTree.root = node
    } else if node.key < parent!.key {
        parent?.left = node
    } else {
        parent?.right = node
    }
}

func transplant<Key: Comparable>(_ binarySearchTree: inout BinarySearchTree<Key>, _ fromNode: Node<Key>?, _ toNode: Node<Key>?) {
    if fromNode?.parent == nil {
        binarySearchTree.root = toNode
    } else if fromNode === fromNode?.parent?.left {
        fromNode?.parent?.left = toNode
    } else {
        fromNode?.parent?.right = toNode
    }

    if toNode != nil {
        toNode?.parent = fromNode?.parent
    }
}

func treeDelete<Key: Comparable>(_ binarySearchTree: inout BinarySearchTree<Key>, _ node: Node<Key>?) {
    if node?.left == nil {
        transplant(&binarySearchTree, node, node?.right)
    } else if node?.right == nil {
        transplant(&binarySearchTree, node, node?.left)
    } else {
        let successor = treeMinimum(node?.right)
        if successor?.parent !== node {
            transplant(&binarySearchTree, successor, successor?.right)
            successor?.right = node?.right
            successor?.right?.parent = successor
        }

        transplant(&binarySearchTree, node, successor)
        successor?.left = node?.left
        successor?.left?.parent = successor
    }
}
