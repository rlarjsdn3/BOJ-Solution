import Foundation

// 정수 9개 입력 받기
var array = [Int]()
for _ in 0..<9 {
    array.append(Int(readLine()!)!)
}
// 정수를 순회하며 최대값이 위치한 위치 찾기
var index = 0
var maxValue = 0
for (i, n) in array.enumerated() where n > maxValue {
    maxValue = n
    index = i
}
// 결과 답안 출력
print(maxValue)
print(index + 1)
