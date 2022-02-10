func partition(_ array: inout [Int], _ low: Int, _ high: Int) -> Int {
    let pivot = array[high]

    var i = low - 1
    for j in low..<high {
        if array[j] <= pivot {
            i += 1
            array.swapAt(i, j)
        }
    }

    array.swapAt(i + 1, high)

    return i + 1
}

func randomizedPartition(_ array: inout [Int], _ low: Int, _ high: Int) -> Int {
    let pivot: Int = .random(in: low...high)

    array.swapAt(high, pivot)

    return partition(&array, low, high)
}

func randomizedQuicksort(_ array: inout [Int], _ low: Int, _ high: Int) {
    if low < high {
        let pivot = randomizedPartition(&array, low, high)
        randomizedQuicksort(&array, low, pivot - 1)
        randomizedQuicksort(&array, pivot + 1, high)
    }
}
