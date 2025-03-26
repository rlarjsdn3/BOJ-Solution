import Foundation

// 수의 개수 N 입력 받기
let n = Int(readLine()!)!

var counting = [Int](repeating: 0, count: 10_001) // 계수 정렬을 위한 배열 선언
// N개만큼 수 입력 받기
for _ in 0..<n {
    counting[Int(readLine()!)!] += 1
}

// 모든 배열을 순회하며 정렬된 값 출력하기
var result = ""
for (i, k) in counting.enumerated() {
    result += String(repeating: "\(i)\n", count: k)
}
// 결과 답안 출력
print(result)
