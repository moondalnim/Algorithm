func squareMatrixMultiplyRecursive(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]] {
    let n = matrixA.count
    var matrixC: [[Int]] = Array(repeating: .init(repeating: 0, count: n), count: n)

    if n == 1 {
        matrixC[0][0] = matrixA[0][0] * matrixB[0][0]
    } else {
        let matrixA00 = matrixA[0..<n / 2].map { $0[0..<n / 2].compactMap { $0 } }
        let matrixA01 = matrixA[0..<n / 2].map { $0[n / 2..<n].compactMap { $0 } }
        let matrixA10 = matrixA[n / 2..<n].map { $0[0..<n / 2].compactMap { $0 } }
        let matrixA11 = matrixA[n / 2..<n].map { $0[n / 2..<n].compactMap { $0 } }
        let matrixB00 = matrixB[0..<n / 2].map { $0[0..<n / 2].compactMap { $0 } }
        let matrixB01 = matrixB[0..<n / 2].map { $0[n / 2..<n].compactMap { $0 } }
        let matrixB10 = matrixB[n / 2..<n].map { $0[0..<n / 2].compactMap { $0 } }
        let matrixB11 = matrixB[n / 2..<n].map { $0[n / 2..<n].compactMap { $0 } }

        let matrixC00 = squareMatrixMultiplyRecursive(matrixA00, matrixB00)
                      + squareMatrixMultiplyRecursive(matrixA01, matrixB10)
        let matrixC01 = squareMatrixMultiplyRecursive(matrixA00, matrixB01)
                      + squareMatrixMultiplyRecursive(matrixA01, matrixB11)
        let matrixC10 = squareMatrixMultiplyRecursive(matrixA10, matrixB00)
                      + squareMatrixMultiplyRecursive(matrixA11, matrixB10)
        let matrixC11 = squareMatrixMultiplyRecursive(matrixA10, matrixB01)
                      + squareMatrixMultiplyRecursive(matrixA11, matrixB11)

        for i in 0..<n / 2 {
            for j in 0..<n / 2 {
                matrixC[i][j] = matrixC00[i][j]
                matrixC[i][j + n / 2] = matrixC01[i][j]
                matrixC[i + n / 2][j] = matrixC10[i][j]
                matrixC[i + n / 2][j + n / 2] = matrixC11[i][j]
            }
        }
    }

    return matrixC
}

extension Array where Element == [Int] {
    static func +(lhs: [[Int]], rhs: [[Int]]) ->[[Int]] {
        let n = lhs.count
        var result = Array(repeating: .init(repeating: 0, count: n), count: n)

        for i in 0..<n {
            for j in 0..<n {
                result[i][j] = lhs[i][j] + rhs[i][j]
            }
        }

        return result
    }
}
