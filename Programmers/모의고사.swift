import Foundation

func solution(_ answers: [Int]) -> [Int] {
    let marks = (
        a: [1, 2, 3, 4, 5],
        b: [2, 1, 2, 3, 2, 4, 2, 5],
        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    )
    var scores: [Int: Int] = [:]

    for (i, answer) in answers.enumerated() {
        if answer == marks.a[i % 5] {
            scores[1] = (scores[1] ?? 0) + 1
        }
        if answer == marks.b[i % 8] {
            scores[2] = (scores[2] ?? 0) + 1
        }
        if answer == marks.c[i % 10] {
            scores[3] = (scores[3] ?? 0) + 1
        }
    }

    let maxScore = scores.values.max() ?? 0

    return scores.filter { $0.value == maxScore }.keys.sorted() 
}
