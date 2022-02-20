func solution(_ a: Int, _ b: Int) -> Int64 {
    let (first, last) = a < b ? (a, b) : (b, a)

    return Int64((abs(last - first) + 1) * (first + last) / 2)
}
