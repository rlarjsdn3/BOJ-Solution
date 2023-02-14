import Foundation

extension Array where Element == Character {
    subscript(guarded index: Int) -> String? {
        guard index < self.count else { return nil }
        
        return String(self[index])
    }
}

// 5개의 문자열 입력 받기
var input: [[Character]] = []
for _ in 0..<5 {
    input.append(Array(readLine()!))
}

// 세로 읽기
var result: [String] = []
for i in 0..<15 {
    for j in 0..<5 {
        result.append(input[j][guarded: i] ?? "")
    }
}
print(result.joined())
