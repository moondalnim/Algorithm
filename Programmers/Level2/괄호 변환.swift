func solution(_ parentheses: String) -> String {
    if parentheses.isEmpty { return "" }

    let (partU, partV) = divide(parentheses)

    if partU.first == "(" {
        return partU + solution(partV)
    } else {
        let startIndex = partU.index(after: partU.startIndex)
        let endIndex = partU.index(before: partU.endIndex)

        return "(" + solution(partV) + ")" + partU[startIndex..<endIndex].map { reverse($0) }
    }
}

func divide(_ parentheses: String) -> (partU: String, partV: String) {
    var count = 0, index = parentheses.startIndex

    repeat {
        count += parentheses[index] == "(" ? 1 : -1
        index = parentheses.index(after: index)
    } while count != 0

    return (partU: String(parentheses[..<index]), partV: String(parentheses[index...]))
}

func reverse(_ parenthesis: Character) -> Character{
    return parenthesis == "(" ? ")" : "("
}
