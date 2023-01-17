import Foundation

// 테스트 케이스의 수 T 입력 받기
let t: Int = Int(readLine()!)!

// 다이내믹 프로그래밍 수행(바텀업)
var dp: [Int] = [Int](repeating: 0, count: 12)

dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4...11 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

// T 개수만큼 정수 N 입력 받고, 결과 저장하기
var result: [Int] = []
for _ in 0..<t {
    result.append(dp[Int(readLine()!)!])
}

// 결과값 출력하기
result.forEach { print($0) }
