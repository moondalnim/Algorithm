import Foundation

func solution(_ newId: String) -> String {
    return newId.step1().step2().step3().step4().step5().step6().step7()
}

extension String {
    func step1() -> Self {
        return self.lowercased()
    }

    func step2() -> Self {
        return self.replacingOccurrences(of: #"[^\w-_.]"#, with: "", options: .regularExpression)
    }

    func step3() -> Self {
        return self.replacingOccurrences(of: #"\.+"#, with: ".", options: .regularExpression)
    }

    func step4() -> Self {  
        return self.trimmingCharacters(in: ["."])
    }

    func step5() -> Self {
        return self.isEmpty ? "a" : self
    }

    func step6() -> Self {
        return self.count > 15
            ? String(self[..<self.index(self.startIndex, offsetBy: 15)]).step4() 
            : self
    }

    func step7() -> Self {
        return self.count < 3
            ? self.padding(toLength: 3, withPad: String(self[self.index(before: self.endIndex)]), startingAt: 0)
            : self
    }
}
