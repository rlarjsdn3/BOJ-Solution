import Foundation

// 자연수의 목표 합 Target 입력 받기
let target = Int(readLine()!)!

// 자연수의 합이 목표 합에 다다를 때까지 반복하기
var sum = 0
var count = 0
while target >= sum {
    count += 1
    sum += count
}
// 답안 결과 출력
print(count - 1)
