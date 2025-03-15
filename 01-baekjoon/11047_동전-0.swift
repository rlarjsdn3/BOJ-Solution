import Foundation

// 동전의 종류 N과 목표 가치 K 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
var (n, k) = (input[0], input[1])
// N개의 동전 종류 입력 받기
var coinTypes: [Int] = []
for _ in 0..<n {
    coinTypes.append(Int(readLine()!)!)
}

var result = 0
// 액면가가 가장 큰 동전부터 개수 구하기
for i in stride(from: n-1, through: 0, by: -1) {
    result += k / coinTypes[i]
    k %= coinTypes[i]
}
// 답안 결과 출력
print(result)
