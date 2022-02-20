func solution(_ x: Int) -> Bool {
    let sumOfDigits = String(x).compactMap { Int(String($0)) }.reduce(0, +)

    return x % sumOfDigits == 0
}
