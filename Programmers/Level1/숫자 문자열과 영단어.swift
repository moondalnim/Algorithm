import Foundation

func solution(_ s: String) -> Int {
    let numbers = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    var result = s
    for (i, number) in numbers.enumerated() {
        result = result.replacingOccurrences(of: number, with: String(i))
    }

    return (result as NSString).integerValue
}
