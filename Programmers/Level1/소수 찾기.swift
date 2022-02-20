import Foundation

func solution(_ n: Int) -> Int {
    return eratos(n)
}

func eratos(_ number: Int) -> Int {
    var sieve = [false, false] + Array(repeating: true, count: number - 1)

    let squareRoot = Int(ceil(sqrt(Float(number))))

    for i in 2..<squareRoot {
        if sieve[i] {
            for j in stride(from: 2 * i, through: number, by: i) {
                sieve[j] = false
            }
        }
    }

    return sieve.filter { $0 }.count
}
