struct PriorityQueue {
    var heap: Heap

    init(_ elements: [Int] = []) {
        self.heap = Heap(elements)
    }
    
    func heapMaximum() -> Int {
        return self.heap.elements[0]
    }

    mutating func heapExtractMax() -> Int {
        if self.heap.size < 1 {
            fatalError("heap underflow")
        }

        let max = heapMaximum()

        self.heap.elements[0] = self.heap.elements[self.heap.size - 1]
        self.heap.elements.removeLast()
        self.heap.maxHeapify(0)

        return max
    }

    mutating func heapIncreaseKey(_ index: Int, _ key: Int) {
        if key < self.heap.elements[index] {
            fatalError("new key is samller than current key")
        }

        self.heap.elements[index] = key

        var index = index
        while index > 0 && self.heap.elements[self.heap.parent(index)] < self.heap.elements[index] {
            self.heap.elements.swapAt(index, self.heap.parent(index))
            index = self.heap.parent(index)
        }
    }

    mutating func maxHeapInsert(_ key: Int) {
        self.heap.elements.append(.min)
        heapIncreaseKey(self.heap.size - 1, key)
    }
}
