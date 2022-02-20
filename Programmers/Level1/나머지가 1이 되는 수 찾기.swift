import Foundation

func solution(_ n: Int) -> Int {
    for divisor in 2..<n - 1 {
        if n % divisor == 1 {
            return divisor
        }
    }

    return n - 1
}
