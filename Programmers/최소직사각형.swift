import Foundation

func solution(_ sizes: [[Int]]) -> Int {
    let widths = sizes.compactMap { $0.max() }.sorted()
    let heights = sizes.compactMap { $0.min() }.sorted()

    return widths[widths.endIndex - 1] * heights[heights.endIndex - 1]
}
