import Foundation

func solution(_ sizes: [[Int]]) -> Int {
    let width = sizes.compactMap { $0.max() }.max() ?? 0
    let height = sizes.compactMap { $0.min() }.max() ?? 0

    return width * height
}
