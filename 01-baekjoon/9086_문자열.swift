import Foundation

// 테스트 케이스의 수 T 입력 받기
let t = Int(readLine()!)!
// 테스트 케이스의 수만큼 문자열 S 입력 받기
for _ in 0..<t {
    let s = readLine()!
    // 결과 답안 출력
    print(s.first! + s.last!)
}

extension Character {
    static func + (lhs: Self, rhs: Self) -> String {
        String(lhs) + String(rhs)
    }
}
