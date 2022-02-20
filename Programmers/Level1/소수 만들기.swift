import Foundation

func solution(_ nums: [Int]) -> Int {
    var answer = 0

    for i in 0..<nums.count {
        for j in i + 1..<nums.count {
            for k in j + 1..<nums.count {
                answer += isPrime(nums[i] + nums[j] + nums[k]) ? 1 : 0
            }
        }
    }

    return answer
}

func isPrime(_ number: Int) -> Bool {
    let squareRoot = Int(ceil(sqrt(Double(number))))

    for i in 2...squareRoot {
        guard number % i != 0 else { 
            return false 
        } 
    }

    return true
}
