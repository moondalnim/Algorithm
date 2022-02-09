func insertionSort(_ array: inout [Int]) -> [Int] {
    for keyIndex in 1..<array.count {
        let key = array[keyIndex]
        var index = keyIndex - 1

        while index >= 0, key < array[index] {
            array[index + 1] = array[index]
            index -= 1
        }
        array[index + 1] = key
    }

    return array
}
