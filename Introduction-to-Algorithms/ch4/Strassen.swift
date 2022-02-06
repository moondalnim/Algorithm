func strassen(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]] {
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

        let matrixS0 = matrixB01 - matrixB11
        let matrixS1 = matrixA00 + matrixA01
        let matrixS2 = matrixA10 + matrixA11
        let matrixS3 = matrixB10 - matrixB00
        let matrixS4 = matrixA00 + matrixA11
        let matrixS5 = matrixB00 + matrixB11
        let matrixS6 = matrixA01 - matrixA11
        let matrixS7 = matrixB10 + matrixB11
        let matrixS8 = matrixA00 - matrixA10
        let matrixS9 = matrixB00 + matrixB01

        let matrixP0 = strassen(matrixA00, matrixS0)
        let matrixP1 = strassen(matrixS1, matrixB11)
        let matrixP2 = strassen(matrixS2, matrixB00)
        let matrixP3 = strassen(matrixA11, matrixS3)
        let matrixP4 = strassen(matrixS4, matrixS5)
        let matrixP5 = strassen(matrixS6, matrixS7)
        let matrixP6 = strassen(matrixS8, matrixS9)

        let matrixC00 = matrixP4 + matrixP3 - matrixP1 + matrixP5
        let matrixC01 = matrixP0 + matrixP1
        let matrixC10 = matrixP2 + matrixP3
        let matrixC11 = matrixP4 + matrixP0 - matrixP2 - matrixP6

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

    static func -(lhs: [[Int]], rhs: [[Int]]) ->[[Int]] {
        let n = lhs.count
        var result = Array(repeating: .init(repeating: 0, count: n), count: n)

        for i in 0..<n {
            for j in 0..<n {
                result[i][j] = lhs[i][j] - rhs[i][j]
            }
        }

        return result
    }
}
