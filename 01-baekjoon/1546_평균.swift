import Foundation

// 과목의 개수 N 입력 받기
let n = Double(readLine()!)!
// 각 과목의 성적 입력 받기
let array = readLine()!.split(separator: " ").map { Double($0)! }

var sum = 0.0 // 점수 합계
let maxValue = array.max()! // 점수 최댓값
// 성적을 순회하며 다시 합계 구하기
for e in array {
    sum += (e / maxValue) * 100.0
}
// 답안 결과 출력
print(sum / n)

