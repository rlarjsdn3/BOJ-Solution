import Foundation

// 9x9 격자판에 정수 입력 받기
var matrix = [[Int]]()
for _ in 0..<9 {
    matrix.append(readLine()!.split(separator: " ").map { Int($0)! })
}

// 각 행과 열을 순회하며 가장 큰 수와 위치 찾기
var row = 0, column = 0
var maxValue = 0
for n in 0..<9 {
    for m in 0..<9 where maxValue < matrix[n][m] {
        maxValue = matrix[n][m]
        row = n
        column = m
    }
}
// 결과 답안 출력
print(maxValue)
print(row + 1, column + 1)
