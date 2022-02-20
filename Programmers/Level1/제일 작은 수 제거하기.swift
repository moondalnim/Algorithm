func solution(_ array: [Int]) -> [Int] {
    let minimum = array.reduce(Int.max) { min($0, $1) }

    return array.count == 1 ? [-1] : array.filter { $0 != minimum }
}
