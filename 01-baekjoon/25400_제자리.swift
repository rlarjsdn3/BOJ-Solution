import Foundation

// 카드의 개수 N 입력 받기
let n = Int(readLine()!)!
// 카드 입력 받기
let cards = readLine()!.split(separator: " ").map { Int($0)! }

var count = 0 // 제자리 카드 개수
var position = 0 // 카드 위치 추적

for i in 0..<n {
    // 해당 위치의 카드가 제자리 카드이면
    if cards[i] == (position + 1) {
        count += 1
        position += 1
    }
}

var result = n - count
print(result) // 결과 답안 출력
