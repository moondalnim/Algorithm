import Foundation

func solution(_ lottos: [Int], _ winNums: [Int]) -> [Int] {    
    let unknownCount = lottos.filter { $0 == 0 }.count
    let matchCount = lottos.filter { winNums.contains($0) }.count

    let minuendForRank = lottos.count + 1
    let maxRank = min(minuendForRank - (matchCount + unknownCount), 6)
    let minRank = min(minuendForRank - matchCount, 6)

    return [maxRank, minRank]
}
