func solution(_ s: String, _ n: Int) -> String {
    return s.utf16.map {
        var unicode = Int($0)
        switch unicode {
        case 65...90:
            unicode = (unicode + n - 65) % 26 + 65
        case 97...122:
            unicode = (unicode + n - 97) % 26 + 97
        default:
            break
        }

        guard let unicodeScalar = UnicodeScalar(unicode) else { return "" }

        return String(unicodeScalar)
    }.joined()
}
