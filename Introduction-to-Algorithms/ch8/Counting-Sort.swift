func countingSort(_ inputs: [Int], _ outputs: inout [Int], _ max: Int) -> Void {
    var counts = Array(repeating: 0, count: max + 1)

    for index in 0..<inputs.count {
        let number = inputs[index]

        counts[number] += 1
    }

    for index in 1...max {
        counts[index] += counts[index - 1]
    }

    for index in (0..<inputs.count).reversed() {
        let number = inputs[index]

        outputs[counts[number] - 1] = inputs[index]
        counts[number] -= 1
    }
}
