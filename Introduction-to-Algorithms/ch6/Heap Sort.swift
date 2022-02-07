func parent(_ index : Int) -> Int {
    return (index - 1) / 2
}

func left(_ index : Int) -> Int {
    return 2 * index + 1
}

func right(_ index : Int) -> Int {
    return 2 * index + 2
}

func maxHeapify(_ array: inout [Int], _ index : Int) {
    let left = left(index)
    let right = right(index)

    var largest = index
    if left <= array.count - 1 && array[left] > array[index] {
        largest = left
    }

    if right <= array.count - 1 && array[right] > array[largest] {
        largest = right
    }

    if largest != index {
        array.swapAt(index, largest)
        maxHeapify(&array, largest)
    }
}

func buildMaxHeap(_ array: inout [Int]) {
    for index in (0..<array.count / 2).reversed() {
        maxHeapify(&array, index)
    }
}

func heapSort(_ array: inout [Int]) {
    var heap = array
    buildMaxHeap(&heap)

    for index in (0..<array.count).reversed() {
        swap(&heap[0], &array[index])
        heap.removeFirst()
        maxHeapify(&heap, 0)
    }
}
