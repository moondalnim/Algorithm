func bucketSort(_ array: inout [Double]) {
    let length = array.count
    var bucket: [[Double]] = Array(repeating: [], count: length)

    for index in 0..<length {
        let bucketIndex = Int(Double(length) * array[index])
        bucket[bucketIndex].append(array[index])
    }

    for bucketIndex in 0..<length where !bucket[bucketIndex].isEmpty {
        insertionSort(&bucket[bucketIndex])
    }

    var index = 0
    for bucketIndex in 0..<length {
        for element in bucket[bucketIndex] {
            array[index] = element
            index += 1
        }
    }
}

func insertionSort(_ array: inout [Double]) {
    for keyIndex in 1..<array.count {
        let key = array[keyIndex]
        var index = keyIndex - 1

        while index >= 0, array[index] > key {
            array[index + 1] = array[index]
            index -= 1
        }    
        array[index + 1] = key
    }
}
