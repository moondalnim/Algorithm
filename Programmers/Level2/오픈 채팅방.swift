enum ActionType: String {
    case enter = "Enter"
    case leave = "Leave"
    case change = "Change"

    func writeAction(with name: String?) -> String? {
        guard let name = name else { return nil }

        switch self {
        case .enter:
            return "\(name)님이 들어왔습니다."
        case .leave:
            return "\(name)님이 나갔습니다."
        case .change:
            return nil
        }
    }
}

func solution(_ records: [String]) -> [String] {
    let splitedRecords = records.map { $0.split(separator: " ").map(String.init) }

    var namesToId: [String: String] = [:]
    splitedRecords
        .filter { $0[0] != ActionType.leave.rawValue }
        .forEach { namesToId[$0[1]] = $0[2] }

    return splitedRecords
        .filter { $0[0] != ActionType.change.rawValue }
        .compactMap { ActionType(rawValue: $0[0])?.writeAction(with: namesToId[$0[1]]) }
}
