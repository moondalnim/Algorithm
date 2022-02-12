func countingSort(_ inputs: [Int], _ outputs: inout [Int], _ digit: Int) -> Void {
    var counts = Array(repeating: 0, count: 10)

    for index in 0..<inputs.count {
        let number = (inputs[index] / digit) % 10

        counts[number] += 1
    }

    for index in 1...9 {
        counts[index] += counts[index - 1]
    }

    for index in (0..<inputs.count).reversed() {
        let number = (inputs[index] / digit) % 10

        outputs[counts[number] - 1] = inputs[index]
        counts[number] -= 1
    }
}

func radixSort(_ array: inout [Int], _ digit: Int) {
    var exponent = 1

    for lsd in stride(from: 1, to: digit, by: exponent * 10) {
        countingSort(array, &array, lsd)
        exponent += 1
    }
}
