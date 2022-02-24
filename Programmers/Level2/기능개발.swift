func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var stack: [Int] = [], answer: [Int] = []

    for index in 0..<progresses.count {
        let remainDay = (100 - progresses[index] + (speeds[index] - 1)) / speeds[index]

        if index > 0, remainDay > stack[0] {
            answer.append(stack.count)
            stack.removeAll()
        }
        stack.append(remainDay)
    }
    answer.append(stack.count)

    return answer
}
