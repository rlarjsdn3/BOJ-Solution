import Foundation

// 계단의 개수 N 입력 받기
let n: Int = Int(readLine()!)!
// N개의 각 계단의 점수 입력 받기
var steps: [Int] = [Int](repeating: 0, count: 300)
for i in 0..<n {
    steps[i] = Int(readLine()!)!
}

// 계산된 결과를 저장하기 위한 DP 테이블 선언
var d: [Int] = [Int](repeating: 0, count: 300)

// 다이내믹 프로그래밍(바텀업) 수행하기
d[0] = steps[0]
d[1] = max(steps[0] + steps[1], steps[1])
d[2] = max(steps[1] + steps[2], steps[0] + steps[2])
/**
 - 첫 번째 계단까지는 (첫 번째 계단)이 최댓값이다.
 - 두 번째 계단까지는 (첫 번째 계단 + 두 번째 계단) 혹은 (두 번째 계단) 중 하나가 최댓값이다.
 - 세 번째 계단까지는 (첫 번째 계단 + 세 번째 계단) 혹은 (두 번째 계단 + 세 번째 단계) 중 하나가 최댓갑이다.
 */
 
for i in stride(from: 3, to: n, by: 1) {
    d[i] = max(steps[i] + steps[i - 1] + d[i - 3], steps[i] + d[i - 2])
    /**
     * 마지막 계단을 무조건 밟고, 연속된 세 개의 계단을 밟으면 안된다면 아래 두 가지 케이스가 존재한다.
        ① (마지막 계단 + 전전 계단)을 밟는 경우
        ② (마지막 계단 + 전 계단 + 전전전 계단)을 밟는 경우
            - 이 덕분에 세 개 계단을 연속으로 밟는 경우가 없어진다.
     */
}
print(d[n - 1]) // 결과값 출력
