func solution(_ phoneNumber: String) -> String {
    return String(repeating: "*", count: phoneNumber.count - 4) + phoneNumber.suffix(4)
}
