import Foundation

func solution(_ price: Int, _ money: Int, _ count: Int) -> Int64 {
    let answer = price * count * (count + 1) / 2 - money

    return answer <= 0 ? .zero : Int64(answer)
}
