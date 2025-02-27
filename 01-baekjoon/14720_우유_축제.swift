import Foundation

// 우유 가게의 수 N 입력 받기
let n = Int(readLine()!)!
// 우유 가게의 정보 입력 받기
let stores = readLine()!.split(separator: " ").map { Int($0)! }

var milk = 0 // 마셔야 하는 우유 종류
var result = 0 // 마실 수 있는 우유 개수

// 가게를 순회하며 순서가 맞는지 확인
for i in 0..<n {
    if stores[i] == milk {
        milk = (milk + 1) % 3
        result += 1
    }
}

print(result) // 최종 답안 출력
