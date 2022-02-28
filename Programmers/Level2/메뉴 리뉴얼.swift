func solution(_ orders: [String], _ courses: [Int]) -> [String] {
    var frequencies: [String: Int] = [:]

    for course in courses {
        for order in orders {
            let sortedOrder = order.sorted()
            for menu in Array(sortedOrder).combinations(ofCount: course) {
                frequencies[String(menu), default: 0] += 1
            }
        }
    }

    var answer: [String] = []
    for course in courses {
        let satisfactions = frequencies.filter { $0.key.count == course && $0.value > 1 }
        let maxCount = satisfactions.reduce(.min) { max($0, $1.value) }
        let menus = satisfactions.filter { maxCount == $0.value }.map { $0.key }
        answer.append(contentsOf: menus)
    }

    return answer.sorted()
}

extension Array {
    func combinations(ofCount count: Int) -> [[Element]] {
        var combinations: [[Element]] = []
        var combination: [Element] = []
        combinate(from: 0, upto: count, into: &combinations, with: &combination)

        return combinations
    }

    private func combinate(
        from start: Int,
        upto count: Int,
        into combinations: inout [[Element]],
        with combination: inout [Element]
    ) {
        if count == 0 {
            return combinations.append(combination)
        }

        for index in start..<self.count {
            combination.append(self[index])
            combinate(from: index + 1, upto: count - 1, into: &combinations, with: &combination)
            combination.popLast()
        }
    }
}
