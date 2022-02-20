func solution(_ n: Int64) -> Int64 {
    return Int64(String(String(n).sorted { $0 > $1 })) ?? .zero
}
