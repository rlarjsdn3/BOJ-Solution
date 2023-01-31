import Foundation

// 전체 상담 일수 N 입력 받기
let n: Int = Int(readLine()!)!
var t: [Int] = [] // 각 상담을 완료하는데 걸리는 시간
var p: [Int] = [] // 각 상담을 완료했을 때 받을 수 있는 금액

for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    t.append(input[0])
    p.append(input[1])
}

// 다이내믹 프로그래밍 수행(바텀업)
var dp: [Int] = [Int](repeating: 0, count: n + 1)
var maxValue: Int = 0

for i in stride(from: n - 1, through: 0, by: -1) {
    let time: Int = t[i] + i
    // 상담이 퇴사일 전에 끝나는 경우
    if time <= n {
        // 점화식에 맞게, 현재까지의 최고 이익 계산
        dp[i] = max(p[i] + dp[time], maxValue)
        maxValue = dp[i]
    // 상담일이 퇴사일에 벗어나는 경우
    } else {
        dp[i] = maxValue
    }
}
print(maxValue) // 결과값 출력하기
