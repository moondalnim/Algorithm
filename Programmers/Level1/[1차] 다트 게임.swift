import Foundation

enum Bonus: String {
    case single = "S"
    case double = "D"
    case triple = "T"

    func apply(to number: Int) -> Int {
        switch self {
        case .single:
            return number
        case .double:
            return Int(pow(Float(number), 2.0))
        case .triple:
            return Int(pow(Float(number), 3.0))
        }
    }
}

enum Option: String {
    case star = "*"
    case ohMy = "#"

    func apply(to number: Int) -> Int {
        switch self {
        case .star:
            return number * 2
        case .ohMy:
            return -number
        }
    }
}

func solution(_ dartResult: String) -> Int {
    let scores = dartResult.split { $0.isLetter || $0 == "#" || $0 == "*" }.compactMap { Int($0) }
    let expressions = dartResult.split { $0.isNumber }

    var results: [Int] = []

    for (index, (score, expression)) in zip(scores, expressions).enumerated() {
        results.append(score)

        for effect in expression {
            let effect = String(effect)
            if let bonus = Bonus(rawValue: effect) {
               results[index] = bonus.apply(to: results[index])
           } else if let option = Option(rawValue: effect) {
               results[index] = option.apply(to: results[index])

               if index > 0, option == .star {
                   results[index - 1] = option.apply(to: results[index - 1])
               }
           }
        }
    }

    return results.reduce(0, +)
}
