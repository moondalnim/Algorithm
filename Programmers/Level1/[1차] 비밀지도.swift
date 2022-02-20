func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {
    return (0..<n).map {
        var binary = String(arr1[$0] | arr2[$0], radix: 2)
        binary = String(repeating: "0", count: n - binary.count) + binary

        return binary.reduce("") { $0 + ($1 == "0" ? " " : "#") }
    }
}
