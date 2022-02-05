func squareMatrixMultiply(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]] {
    let n = matrixA.count
    var matrixC = Array(repeating: Array(repeating: 0, count: n), count: n)

    for i in 0..<n {
        for j in 0..<n {
            matrixC[i][j] = 0
            for k in 0..<n {
                matrixC[i][j] += matrixA[i][k] * matrixB[k][j]
            }
        }
    }

    return matrixC
}
