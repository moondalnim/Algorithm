import Foundation

func solution(_ numbers: [Int]) -> [Int] {
    var results: Set<Int> = []

    for i in 0..<numbers.count {
        for j in i + 1..<numbers.count {
            results.insert(numbers[i] + numbers[j])
        }
    }

    return results.sorted()
}
