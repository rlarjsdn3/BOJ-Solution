import Foundation

// 정수 N 입력 받기
let n: Int = Int(readLine()!)!

// 앞서 계산된 결과를 저장하기 위한 DP 테이블 초기화
var d: [Int] = [Int](repeating: 0, count: 1_001)

// 다이내믹 프로그래밍 수행(바텀업)
d[1] = 1
d[2] = 3
for i in stride(from: 3, through: n, by: 1) {
    d[i] = (d[i - 1] + d[i - 2] * 2) % 10_007
}
print(d[n]) // 결과값 출력하기
