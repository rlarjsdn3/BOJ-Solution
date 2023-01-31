import Foundation

// 테스트 케이스의 수 T 입력 받기
let t: Int = Int(readLine()!)!

// T 개수 만큼 문자열을 입력 받고, 결과값 저장하기
var result: [String] = []
for _ in 0..<t {
    var input: [String] = readLine()!.split(separator: " ").map { String($0) }
    for i in 0..<input.count {
        input[i] = String(input[i].reversed())
    }
    result.append(input.joined(separator: " "))
}
// 결과값 출력하기
result.forEach { print($0) }
