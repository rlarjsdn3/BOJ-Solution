import Foundation

// 사람의 수 N 입력 받기
let n = Int(readLine()!)!
// 각 사람이 돈을 인출하는 데 걸리는 시간 입력 받기
let times = readLine()!.split(separator: " ")
    .map { Int($0)! }.sorted()

// 인출하는 데 필요한 최소 시간의 합 구하기
var sum = 0, result = 0
for time in times {
    result += sum + time
    sum += time
}
print(result) // 결과 답안 출력
