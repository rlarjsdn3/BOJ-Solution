import Foundation

// 테스트 케이스의 수 T 입력 받기
let t: Int = Int(readLine()!)!
// T개의 A, B 입력 받기
var result: [Int] = [] // 결과 저장을 위한 변수
for _ in 0..<t {
    result.append(readLine()!.split(separator: ",").map { Int(String($0))! }.reduce(0, +))
}
// 결과값 출력하기
result.forEach { print($0) }
