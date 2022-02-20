import Foundation

struct Stack {
    private var storage: [Int] = []

    mutating func push(_ element: Int) {
        self.storage.append(element)
    }

    @discardableResult
    mutating func pop() -> Int? {
        self.storage.popLast()
    }

    func peek() -> Int? {
        self.storage.last
    }
}

func solution(_ board: [[Int]], _ moves: [Int]) -> Int {
    var board = board
    let moves = moves.map { $0 - 1 }

    var basket = Stack()
    var result = 0

    moves.forEach { column in
        for row in 0..<board.count {
            let doll = board[row][column] 
            guard doll != 0 else { continue }

            if basket.peek() == doll {
                basket.pop()
                result += 2
            } else {
                basket.push(doll)
            }

            board[row][column] = 0

            break
        }
    }

    return result
}
