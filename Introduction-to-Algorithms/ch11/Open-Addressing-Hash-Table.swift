struct K {
    static let hashTableSize = 1024
    static let deleted = -1
}

func hashUsingDivision(_ key: Int) -> Int {
    return key % K.hashTableSize
}

func hashUsingMultiplication(_ key: Int) -> Int {
    let knuth = 0.6180339887

    return Int(Double(K.hashTableSize) * (Double(key) * knuth.truncatingRemainder(dividingBy: 1)))
}

struct HashTable {
    private var bucket: [Int?]

    init() {
        self.bucket = Array(repeating: nil, count: K.hashTableSize)
    }

    subscript(hashValue: Int) -> Int? {
        get {
            self.bucket[hashValue]
        }
        set {
            self.bucket[hashValue] = newValue
        }
    }
}

func hashUsingLinearProbing(_ key: Int, _ index: Int) -> Int {
    return (hashUsingDivision(key) + index) % K.hashTableSize
}

func hashUsingQuadraticProbing(_ key: Int, _ index: Int) -> Int {
    let const1 = 1 / 2, const2 = 1 / 2

    return (hashUsingMultiplication(key) + const1 * index + const2 * index * index) % K.hashTableSize
}

func hashUsingDoubleHashing(_ key: Int, _ index: Int) -> Int {
    return (hashUsingDivision(key) + index * hashUsingMultiplication(key)) % K.hashTableSize
}

func hashInsert(_ hashTable: inout HashTable, _ key: Int) -> Int {
    for index in 0...K.hashTableSize {
        let hashValue = hashUsingDoubleHashing(key, index)

        if hashTable[hashValue] == nil || hashTable[hashValue] == K.deleted {
            hashTable[hashValue] = key

            return hashValue
        }
    }

    fatalError("hash table overflow")
}

func hashSearch(_ hashTable: HashTable, _ key: Int) -> Int? {
    for index in 0...K.hashTableSize {
        let hashValue = hashUsingDoubleHashing(key, index)

        if hashTable[hashValue] == nil {
            return nil
        } else if hashTable[hashValue] == key {
            return hashValue
        }
    }

    return nil
}

func hashDelete(_ hashTable: inout HashTable, _ key: Int) {
    for index in 0...K.hashTableSize {
        let hashValue = hashUsingDoubleHashing(key, index)

        if hashTable[hashValue] == key {
            hashTable[hashValue] = K.deleted

            return
        }
    }
}

