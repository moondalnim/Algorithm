func gcd(_ a: Int64, _ b: Int64) -> Int64 {
    return b == 0 ? a : gcd(b, a % b)
}

func solution(_ width: Int, _ height: Int) -> Int64 {
    let width = Int64(width)
    let height = Int64(height)

    return width * height - (width + height - gcd(width, height))
}
