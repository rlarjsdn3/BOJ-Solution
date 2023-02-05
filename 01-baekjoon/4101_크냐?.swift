import Foundation

// 두 양의 정수 입력 받고, 결과값을 저장
var result: [String] = []
while true {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    if (input[0] + input[1]) == 0 { break }
    result.append(input[0] > input[1] ? "Yes" : "No")
}
result.forEach { print($0) } // 결과값 출력하기
