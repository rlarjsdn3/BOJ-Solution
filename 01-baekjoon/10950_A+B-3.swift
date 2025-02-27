import Foundation

// 테스트 케이스의 개수 T 입력 받기
let t = Int(readLine()!)!

for _ in 0..<t {
    // A, B 입력 받고 결과 답안 출력
    let input = readLine()!.split(separator: " ").map { Int($0)! }
        .reduce(0, +)
    print(input)
}
