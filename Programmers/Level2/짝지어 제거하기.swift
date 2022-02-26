func solution(_ letters: String) -> Int {
    var stack: [Character] = []

    letters.forEach {
        if stack.last == $0 {
            stack.popLast()
        } else {
            stack.append($0)
        }
    }

    return stack.isEmpty ? 1 : 0
}
