import Foundation

func solution(_ n: Int) -> Int {
    let ternary = String(n, radix: 3)

    return Int(String(ternary.reversed()), radix: 3) ?? 0
}
