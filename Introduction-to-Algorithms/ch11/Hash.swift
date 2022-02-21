struct K {
    static let hashTableSizePreferredPrimeNumber = 701
    static let hashTableSizePreferredPowerOfTwo = 1024
}

func hashDivisionMethod(_ key: Int) -> Int {
    return key % K.hashTableSizePreferredPrimeNumber
}

func hashMultiplicationMethod(_ key: Int) -> Int {
    let knuth = 0.6180339887

    return Int(Double(K.hashTableSizePreferredPowerOfTwo) * (Double(key) * knuth).truncatingRemainder(dividingBy: 1))
}
