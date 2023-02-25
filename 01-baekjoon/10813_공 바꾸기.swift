import Foundation

// 공의 개수 N과 바꿀 횟수 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 공을 담은 배열 초기화
var ball = [Int](repeating: 0, count: n + 1)
(0...n).forEach { ball[$0] = $0 }

// 공의 순서 바꾸기
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    // input[0]번 바구니와 input[1]번 바구니 교환
    ball.swapAt(input[0], input[1])
}
// 결과값 출력하기
(1...n).forEach { print(ball[$0], terminator: " ") }
