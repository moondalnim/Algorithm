func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {
    var answer: [String] = []

    for i in 0..<n {
        let result = String(arr1[i] | arr2[i], radix: 2)
            .replacingOccurrences(of: "1", with: "#")
            .replacingOccurrences(of: "0", with: " ")

        answer.append(String(repeating: " ", count: n - result.count) + result)
    }

    return answer
}
