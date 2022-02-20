func solution(_ n: Int64) -> [Int] {
    return String(n).compactMap { Int(String($0)) }.reversed()
}
