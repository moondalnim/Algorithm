func merge(_ array: inout [Int], _ start: Int, _ mid: Int, _ end: Int) -> Void {
    let leftCount = mid - start + 1
    let rightCount = end - mid

    var left = Array(repeating: 0, count: leftCount + 1)
    var right = Array(repeating: 0, count: rightCount + 1)

    for leftIndex in 0..<leftCount {
        left[leftIndex] = array[start + leftIndex]
    }
    for rightIndex in 0..<rightCount {
        right[rightIndex] = array[mid + 1 + rightIndex]
    }

    left[leftCount] = .max
    right[rightCount] = .max

    var leftIndex = 0
    var rightIndex = 0
    for index in start...end {
        if left[leftIndex] <= right[rightIndex] {
            array[index] = left[leftIndex]
            leftIndex += 1
        } else {
            array[index] = right[rightIndex]
            rightIndex += 1
        }
    }
}

func mergeSort(_ array: inout [Int], _ start: Int, _ end: Int) {
    if start < end {
        let mid = (start + end) / 2
        mergeSort(&array, start, mid)
        mergeSort(&array, mid + 1, end)
        merge(&array, start, mid, end)
    }
}
