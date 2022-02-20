func solution(_ s: String) -> String {
    let index = s.count % 2 == 0 ? s.count / 2 - 1 : s.count / 2
    let range = s.index(s.startIndex, offsetBy: index)..<s.index(s.endIndex, offsetBy: -index)
    
    return String(s[range])
}
