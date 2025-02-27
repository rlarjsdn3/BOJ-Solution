import Foundation

// 마을의 수 N 입력 받기
let n = Int(readLine()!)!
// 마을 사이 이동 비용 입력 받기
var costs = readLine()!.split(separator: " ").map { Int($0)! }

// 이동 비용을 오름차순으로 정렬
costs.sort()

let result = costs.reduce(0, +) - costs.last!
print(result) // 결과 답안 출력
