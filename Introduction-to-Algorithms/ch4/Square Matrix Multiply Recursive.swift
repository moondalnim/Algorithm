func squareMatrixMultiplyRecursive(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]] {
    let n = matrixA.count
    var matrixC: [[Int]] = Array(repeating: .init(repeating: 0, count: n), count: n)

    if n == 1 {
        matrixC[0][0] = matrixA[0][0] * matrixB[0][0]
    } else {
        var matrixA00 = Array(repeating: Array(repeating: 0, count: n / 2), count: n / 2)
        var matrixA01 = Array(repeating: Array(repeating: 0, count: n / 2), count: n / 2)
        var matrixA10 = Array(repeating: Array(repeating: 0, count: n / 2), count: n / 2)
        var matrixA11 = Array(repeating: Array(repeating: 0, count: n / 2), count: n / 2)
        var matrixB00 = Array(repeating: Array(repeating: 0, count: n / 2), count: n / 2)
        var matrixB01 = Array(repeating: Array(repeating: 0, count: n / 2), count: n / 2)
        var matrixB10 = Array(repeating: Array(repeating: 0, count: n / 2), count: n / 2)
        var matrixB11 = Array(repeating: Array(repeating: 0, count: n / 2), count: n / 2)
        
        for row in 0..<n / 2 {
            for column in 0..<n / 2 {
                matrixA00[row][column] = matrixA[row][column]
                matrixA01[row][column] = matrixA[row][column + n / 2]
                matrixA10[row][column] = matrixA[row + n / 2][column]
                matrixA11[row][column] = matrixA[row + n / 2][column + n / 2]
                matrixB00[row][column] = matrixB[row][column]
                matrixB01[row][column] = matrixB[row][column + n / 2]
                matrixB10[row][column] = matrixB[row + n / 2][column]
                matrixB11[row][column] = matrixB[row + n / 2][column + n / 2]
            }
        }

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
    static func +(lhs: [[Int]], rhs: [[Int]]) -> [[Int]] {
        zip(lhs, rhs).map { zip($0, $1).map(+) }
    }
}
