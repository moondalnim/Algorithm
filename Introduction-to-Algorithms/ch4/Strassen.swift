func strassen(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]] {
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
    static func +(lhs: [[Int]], rhs: [[Int]]) -> [[Int]] {
        zip(lhs, rhs).map { zip($0, $1).map(+) }
    }

    static func -(lhs: [[Int]], rhs: [[Int]]) -> [[Int]] {
        zip(lhs, rhs).map { zip($0, $1).map(-) }
    }
}
