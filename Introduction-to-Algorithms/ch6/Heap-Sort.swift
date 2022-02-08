struct Heap {
    var elements: [Int] = []

    var size: Int {
        return self.elements.count
    }

    init(_ elements: [Int]) {
        self.elements = elements

        buildMaxHeap()
    }

    func parent(_ index : Int) -> Int {
        return (index - 1) / 2
    }

    func left(_ index : Int) -> Int {
        return 2 * index + 1
    }

    func right(_ index : Int) -> Int {
        return 2 * index + 2
    }

    mutating func maxHeapify(_ index : Int) {
        let left = left(index)
        let right = right(index)

        var largest = index
        if left <= self.size - 1 && self.elements[left] > self.elements[index] {
            largest = left
        }
        if right <= self.size - 1 && self.elements[right] > self.elements[largest] {
            largest = right
        }

        guard largest != index else { return }

        self.elements.swapAt(index, largest)
        maxHeapify(largest)
    }

    mutating func buildMaxHeap() {
        for index in (0..<self.size / 2).reversed() {
            maxHeapify(index)
        }
    }
}

extension Heap {
    static func heapSort(_ array: inout [Int]) {
        var heap = Heap(array)

        for index in (0..<heap.size).reversed() {
            swap(&heap.elements[0], &array[index])
            heap.elements.removeFirst()
            heap.maxHeapify(0)
        }
    }
}
