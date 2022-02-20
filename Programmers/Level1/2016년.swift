import Foundation

func solution(_ month: Int, _ day: Int) -> String {
    let weekDays = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let monthDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    let dayDifference = monthDays[0..<month - 1].reduce(0, +) + day

    return weekDays[dayDifference % 7]
}
