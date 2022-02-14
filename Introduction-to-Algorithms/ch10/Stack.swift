struct K {
    static let maxStackSize = 7
}

struct Stack<Element>: ExpressibleByArrayLiteral {
    private var storage: [Element?] = Array(repeating: nil, count: K.maxStackSize)

    var top: Int = 0

    init(arrayLiteral elements: Element?...) {
        let size = elements.count

        self.storage = elements + Array(repeating: nil, count: K.maxStackSize - size)
        self.top = size
    }

    subscript(index: Int) -> Element? {
        get {
            self.storage[index]
        }
        set {
            self.storage[index] = newValue
        }
    }
}

func stackEmpty<Element>(_ stack: Stack<Element>) -> Bool {
    return stack.top == 0
}

func push<Element>(_ stack: inout Stack<Element>, _ element: Element) {
    stack.top += 1
    stack[stack.top - 1] = element
}

func pop<Element>(_ stack: inout Stack<Element>) -> Element? {
    if stackEmpty(stack) {
        fatalError("underflow")
    } else {
        stack.top -= 1

        return stack[stack.top]
    }
}
