import Foundation

// 테스트 케이스의 수 T 입력 받기
let t: Int = Int(readLine()!)!

var result: [Int] = []
for _ in 0..<t {
    // 배열 요소의 개수 N 입력 받기
    let _: Int = Int(readLine()!)!
    // N 개의 정수를 입력 받고, 그 합을 결과 변수에 저장
    result.append(readLine()!.split(separator: " ").map { Int(String($0))! }.reduce(0, +))
}
result.forEach { print($0) } // 결과값 출력하기
