func solution(_ s: String) -> Bool {
    let s = s.lowercased()

    return s.filter { $0 == "p" }.count == s.filter { $0 == "y" }.count
}
