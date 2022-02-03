func findMaxCrossingSubarray(_ array: [Int], _ low: Int, _ mid: Int, _ high: Int) -> (Int, Int, Int) {
    var maxLeft = low
    var leftSum = Int.min
    var sum = 0

    for crossLow in (low...mid).reversed() {
        sum += array[crossLow]

        if sum > leftSum {
            leftSum = sum
            maxLeft = crossLow
        }
    }

    var maxRight = high
    var rightSum = Int.min
    sum = 0

    for crossHigh in (mid + 1)...high {
        sum += array[crossHigh]

        if sum > rightSum {
            rightSum = sum
            maxRight = crossHigh
        }
    }

    return (maxLeft, maxRight, leftSum + rightSum)
}

func findMaximumSubarray(_ array: [Int], _ low: Int, _ high: Int) -> (Int, Int, Int) {
    if high == low {
        return (low, high, array[low])
    } else {
        let mid = (low + high) / 2

        let (leftLow, leftHigh, leftSum) = findMaximumSubarray(array, low, mid)
        let (rightLow, rightHigh, rightSum) = findMaximumSubarray(array, mid + 1, high)
        let (crossLow, crossHigh, crossSum) = findMaxCrossingSubarray(array, low, mid, high)

        if leftSum >= crossSum && leftSum >= rightSum {
            return (leftLow, leftHigh, leftSum)
        } else if rightSum >= crossSum && rightSum >= leftSum {
            return (rightLow, rightHigh, rightSum)
        } else {
            return (crossLow, crossHigh, crossSum)
        }
    }
}
