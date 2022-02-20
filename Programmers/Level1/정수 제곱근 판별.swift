import Foundation

func solution(_ n: Int64) -> Int64 {
    let squareRoot = Int64(sqrt(Float(n)))

    return squareRoot * squareRoot == n ? (squareRoot + 1) * (squareRoot + 1) : -1
}
