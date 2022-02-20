import Foundation

func solution(_ departments: [Int], _ budget: Int) -> Int {
    var budget = budget

    return departments.sorted().filter {
        budget -= $0

        return budget >= 0
    }.count
}
