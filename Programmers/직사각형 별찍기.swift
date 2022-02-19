let input = readLine()!.split(separator: " ").map { Int($0)! }
print(String(repeating: String(repeating: "*", count: input[0]) + "\n", count: input[1]))
