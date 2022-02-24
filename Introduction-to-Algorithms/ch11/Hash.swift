struct K {
    static let anyPrimeNumber = 701
    static let anyValueForPowerOfTwo = 1024
}

func hashUsingDivision(_ key: Int) -> Int {
    let hashTableSize = K.anyPrimeNumber

    return key % hashTableSize
}

func hashUsingMultiplication(_ key: Int) -> Int {
    let knuth = 0.6180339887
    let hashTableSize = K.anyValueForPowerOfTwo

    return Int(Double(hashTableSize) * (Double(key) * knuth.truncatingRemainder(dividingBy: 1)))
}
