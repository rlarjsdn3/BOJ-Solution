import Foundation

// 총 금액 X 입력 받기
let x = Int(readLine()!)!
// 구매한 물건의 개수 N 입력 받기
let n = Int(readLine()!)!

var sum = 0 // 물건 가격 합

for _ in 0..<n {
    // 물건의 가격 a와 개수 b 입력 받기
    let input = readLine()!.split(separator: " ").map { Int($0)! }
        .reduce(1, *)
    sum += input
}

print(sum == x ? "Yes" : "No") // 결과 답안 출력
