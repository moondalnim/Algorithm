func solution(_ x: Int, _ n: Int) -> [Int64] {
    (1...n).map { Int64($0 * x) }
}
