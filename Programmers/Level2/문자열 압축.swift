func solution(_ string: String) -> Int {
    let string = Array(string)

    return (1...string.count / 2 + 1)
        .map { string.count - compress(string, from: 0, strideBy: $0, repeated: 0) }
        .min() ?? string.count
}

func compress(
    _ string: [Character],
    from index: Int,
    strideBy size: Int,
    repeated times: Int
) -> Int {
    let current = index..<index + size
    let next = index + size..<index + 2 * size

    guard next.upperBound <= string.count else {
        return -countNumberOfLetters(byRepeated: times)
    }

    if string[current] == string[next] {
        return compress(string, from: index + size, strideBy: size, repeated: times + 1) + size
    } else {
        return compress(string, from: index + size, strideBy: size, repeated: 0)
            - countNumberOfLetters(byRepeated: times)
    }
}

func countNumberOfLetters(byRepeated times: Int) -> Int {
    return times == 0 ? 0 : String(times + 1).count
}


