import Foundation

// 윷짝의 상태 3개 입력 받기
let y: [String] = ["E", "A", "B", "C", "D"] // 윷짝의 정보를 저장한 변수

var result: [String] = [] // 결과를 저장한 변수
for _ in 0..<3 {
    let input: Int = readLine()!.split(separator: " ").filter { String($0) == "0" }.count
    result.append(y[input])
}
result.forEach { print($0) } // 결과값 출력하기
