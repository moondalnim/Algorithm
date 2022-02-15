struct K {
    static let maxQueueSize = 12
}

struct Queue<Element>: ExpressibleByArrayLiteral {
    private var array: [Element?] = Array(repeating: nil, count: K.maxQueueSize)

    var head: Int = 0
    var tail: Int = 1

    var length: Int {
        return array.count
    }

    init(_ head: Int, _ elements: [Element]) {
        self.tail = head
        for element in elements {
            enqueue(&self, element)
            print(self)
        }
        self.head = head
    }

    init(arrayLiteral elements: Element?...) {
        let size = elements.count

        self.array = elements + Array(repeating: nil, count: K.maxQueueSize - size)
        self.head = 1
        self.tail = size + 1
    }

    subscript(index: Int) -> Element? {
        get {
            self.array[(index - 1) % self.length]
        }
        set {
            self.array[(index - 1) % self.length] = newValue
        }
    }
}

func enqueue<Element>(_ queue: inout Queue<Element>, _ element: Element) {
    if queue.head == queue.tail + 1 || queue.head == 1 && queue.tail == queue.length {
        fatalError("overflow")
    } else {
        queue[queue.tail] = element
        if queue.tail == queue.length {
            queue.tail = 1
        } else {
            queue.tail += 1
        }
    }
}

func dequeue<Element>(_ queue: inout Queue<Element>) -> Element? {
    if queue.head == queue.tail {
        fatalError("underflow")
    } else {
        let element = queue[queue.head]
        if queue.head == queue.length {
            queue.head = 1
        } else {
            queue.head += 1
        }

        return element
    }
}
