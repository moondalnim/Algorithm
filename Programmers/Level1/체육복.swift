import Foundation

func solution(_ n: Int, _ losts: [Int], _ reserves: [Int]) -> Int {
    let intersections = Set(reserves).intersection(losts)
    let reserves = Set(reserves).subtracting(intersections).sorted()
    var losts = Set(losts).subtracting(intersections).sorted()

    for reserve in reserves.reversed() {
        if losts.contains(reserve + 1) {
            losts.popLast()
        } else if losts.contains(reserve - 1) {
            losts.popLast()
        }
    }

    return n - losts.count
}
