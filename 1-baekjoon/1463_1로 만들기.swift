import Foundation

// 정수 N 입력 받기
let n: Int = Int(readLine()!)!

// 계산한 값을 저장하기 위한 DP 테이블
var d: [Int] = [Int](repeating: 0, count: n + 1)

// 다이내믹 프로그래밍 수행(바텀업)
d[0] = 0
d[1] = 0
for i in stride(from: 2, through: n, by: 1) {
    // 1을 빼는 경우
    d[i] = d[i - 1] + 1
    
    // 2로 나누어 떨어지는 경우
    if i % 2 == 0 {
        d[i]  = min(d[i], d[i / 2] + 1)
    }
    
    // 3으로 나누어 떨어지는 경우
    if i % 3 == 0 {
        d[i] = min(d[i], d[i / 3] + 1)
    }
}
print(d[n]) // 결과값 출력
