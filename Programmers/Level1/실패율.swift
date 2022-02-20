import Foundation

func solution(_ n: Int, _ stages: [Int]) -> [Int] {
    var stageCount = stages.count
    var failures = Array(repeating: 0, count: n + 1)
    var failureRates: [Int: Float] = [:]

    for stage in stages {
        failures[stage - 1] += 1
    }

    for i in 1...n {
        let failureRate = Float(failures[i - 1]) / Float(stageCount)
        stageCount -= failures[i - 1]

        failureRates[i] = failureRate.isNaN ? 0 : failureRate
    }

    return failureRates.sorted { ($0.1, $1.0) > ($1.1, $0.0) }.map { $0.key }
}
