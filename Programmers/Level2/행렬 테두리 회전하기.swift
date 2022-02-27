func solution(_ rows: Int, _ columns: Int, _ queries: [[Int]]) -> [Int] {
    var matrix: [[Int]] = Array(repeating: [], count: rows)
    for row in 0..<rows {
        for column in 0..<columns {
            matrix[row].append(columns * row + column + 1)
        }
    }

    let queries = queries.map { $0.map { $0 - 1 } }
    var results: [Int] = []
    for query in queries {
        let minRow = query[0], minColumn = query[1], maxRow = query[2], maxColumn = query[3]

        let indexes: [(row: Int, column: Int)] =
            (minColumn..<maxColumn).map { (minRow, $0) } as [(Int, Int)] +
            (minRow..<maxRow).map { ($0, maxColumn) } as [(Int, Int)] +
            (minColumn + 1…maxColumn).reversed().map { (maxRow, $0) } as [(Int, Int)] +
            (minRow + 1…maxRow).reversed().map { ($0, minColumn) } as [(Int, Int)]
        var values = indexes.map { matrix[$0.row][$0.column] }

        var value = values[0]
        values[0] = values[values.count - 1]
        for index in 1..<values.count {
            let temp = value
            value = values[index]
            values[index] = temp
        }

        results.append(values.reduce(.max, { min($0, $1) }))

        indexes.enumerated().forEach {
            matrix[indexes[$0.offset].row][indexes[$0.offset].column] = values[$0.offset]
        }
    }

    return results
}
