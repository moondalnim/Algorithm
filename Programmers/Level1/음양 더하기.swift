import Foundation

func solution(_ absolutes: [Int], _ signs: [Bool]) -> Int {
    return zip(absolutes, signs).reduce(0) { $0 + ($1.1 ? $1.0 : -$1.0)  }
}
