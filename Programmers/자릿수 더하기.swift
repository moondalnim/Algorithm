func solution(_ n: Int) -> Int {
    return String(n).reduce(0) { $0 + (Int(String($1)) ?? 0) }
}
