import Foundation

// 포도주 잔의 개수 N 입력 받기
let n: Int = Int(readLine()!)!

// 포도주 잔의 정보 입력 받기
var wine: [Int] = [Int](repeating: 0, count: 10_000)
for i in 0..<n {
    wine[i] = Int(readLine()!)!
}

// 다이내믹 프로그래밍 수행(바텀업)
var dp: [Int] = [Int](repeating: 0, count: 10_000)

dp[0] = wine[0]
dp[1] = wine[0] + wine[1]
dp[2] = max(max(wine[0] + wine[2], wine[1] + wine[2]), dp[1])

for i in stride(from: 3, to: n, by: 1) {
    // ① 현재 포도주와 이전 포도주를 마시고 전전 포도주는 마시지 않는다. ( wine[i]+wine[i-1]+dp[i-3] )
    // ② 현재 포도주와 전전 포도주를 마시고 이전 포도주는 마시지 않는다. ( wine[i]+dp[i-2] )
    // ③ 현재 포도주를 마시지 않는다. ( d[i-1] )
    dp[i] = max(max(wine[i] + wine[i - 1] + dp[i - 3], wine[i] + dp[i - 2]), dp[i - 1])
    // 참고: 마지막 잔을 마사지 (현재 포도주를 마시지) 않을 때가 더 많이 마시는 경우도 있으니 고려해야 함.
    //      ex1) 100 100 1 ( 정답: 200 )
    //      ex2) 100 400 2 1 4 200 ( 정답: 704 )
}

// 결과값 출력하기
print(dp[n - 1])
