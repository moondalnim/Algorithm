struct K {
    static let hashTableSizePreferredPrimeNumber = 701
    static let deleted = -1
}

extension Int {
    var deleted: Int {
        return -1
    }
}

struct HashTable {
    private var bucket: [Int?]

    init() {
        self.bucket = Array(repeating: nil, count: K.hashTableSizePreferredPrimeNumber)
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

func hash(_ key: Int, _ index: Int) -> Int {
    return (hashDivisionMethod(key) + index) % K.hashTableSizePreferredPrimeNumber
}

func hashDivisionMethod(_ key: Int) -> Int {
    return key % K.hashTableSizePreferredPrimeNumber
}

func hashInsert(_ hashTable: inout HashTable, _ key: Int) -> Int {
    for index in 0...K.hashTableSizePreferredPrimeNumber {
        let hashValue = hash(key, index)

        if hashTable[hashValue] == nil || hashTable[hashValue] == K.deleted {
            hashTable[hashValue] = key

            return hashValue
        }
    }

    fatalError("hash table overflow")
}

func hashSearch(_ hashTable: HashTable, _ key: Int) -> Int? {
    for index in 0...K.hashTableSizePreferredPrimeNumber {
        let hashValue = hash(key, index)

        if hashTable[hashValue] == nil {
            return nil
        } else if hashTable[hashValue] == key {
            return hashValue
        }
    }

    return nil
}

func hashDelete(_ hashTable: inout HashTable, _ key: Int) {
    for index in 0...K.hashTableSizePreferredPrimeNumber {
        let hashValue = hash(key, index)

        if hashTable[hashValue] == key {
            hashTable[hashValue] = K.deleted

            return
        }
    }
}
