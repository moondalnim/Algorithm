import Foundation

enum Hand: String {
    case left = "L"
    case right = "R"
}

class NumberPad {
    let hand: Hand
    var number: Int

    init(number: Int, hand: Hand) {
        self.number = number
        self.hand = hand
    }

    func distance(from number: Int) -> Int {
        return abs(self.number - number) / 3 + abs(self.number - number) % 3
    }
}

func solution(_ numbers: [Int], _ handedness: String) -> String {
    var result = ""

    let leftHandPad = NumberPad(number: 9, hand: .left)
    let rightHandPad = NumberPad(number: 11, hand: .right)

    numbers.forEach { number in
        let number = number == 0 ? 10 : number - 1

        let column = number % 3
        let leftDistance = leftHandPad.distance(from: number)
        let rightDistance = rightHandPad.distance(from: number)

        let pad: NumberPad
        if column == 0 || (column == 1 && leftDistance < rightDistance) {
            pad = leftHandPad
        } else if column == 2 || (column == 1 && rightDistance < leftDistance) {
            pad = rightHandPad
        } else {
            pad = handedness == "left" ? leftHandPad : rightHandPad
        }

        pad.number = number
        result.append(pad.hand.rawValue)
    }

    return result
}
