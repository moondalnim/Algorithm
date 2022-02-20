extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
}

func solution(_ strings: [String], _ n: Int) -> [String] {
    return strings.sorted { ($0[n], $0) < ($1[n], $1) }
}
