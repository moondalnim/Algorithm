func solution(_ users: [String], _ reports: [String], _ criteria: Int) -> [Int] {
    var reportersToUser: [String: [String]] = [:]
    for report in Set(reports) {
        let splited = report.split(separator: " ").map { String($0) }
        let (reporter, user) = (splited[0], splited[1])

        reportersToUser[user, default: []] += [reporter]
    }

    reportersToUser = reportersToUser.filter { criteria <= $0.value.count }

    var countsInUser: [String: Int] = [:]
    for reporters in reportersToUser.values {
        for reporter in reporters {
            countsInUser[reporter, default: 0] += 1
        }
    }

    return users.map { countsInUser[$0] ?? 0 }
}
