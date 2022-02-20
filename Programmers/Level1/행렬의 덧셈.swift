func solution(_ arr1: [[Int]], _ arr2: [[Int]]) -> [[Int]] {
    return arr1 + arr2
}

extension Array where Element == [Int] {
    static func +(lhs: [[Int]], rhs: [[Int]]) -> [[Int]] {
        zip(lhs, rhs).map { zip($0, $1).map(+) }
    }
}
