func squareMatrixMultiply(_ array1: [[Int]], _ array2: [[Int]]) -> [[Int]] {
    let n = array1.count
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)

    for i in 0..<n {
        for j in 0..<n {
            result[i][j] = 0
            for k in 0..<n {
                result[i][j] += array1[i][k] * array2[k][j]
            }
        }
    }

    return result
}
