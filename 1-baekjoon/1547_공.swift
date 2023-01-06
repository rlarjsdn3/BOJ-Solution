import Foundation

// 교환 횟수 M 입력 받기
let m: Int = Int(readLine()!)!
// M개의 교환할 컵의 위치 입력 받고, 결과값 출력하기
var ball: [Int] = [0, 1, 0, 0]
for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    ball.swapAt(input[0], input[1])
}
print(ball.firstIndex(of: 1)!)
