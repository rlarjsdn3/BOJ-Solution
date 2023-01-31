import Foundation

// 정수 N 입력 받기
let n: Int = Int(readLine()!)!
// 설탕 포대의 무게 단위를 저장한 배열 선언
let sugar: [Int] = [3, 5]

// 계산된 결과를 저장하기 위한 DP 테이블
var d: [Int] = [Int](repeating: 5_001, count: n + 1)

// 다이내믹 프로그래밍 수행(바텀업 방식)
d[0] = 0
for i in 0..<2 {
    for j in stride(from: sugar[i], through: n, by: 1) {
        if d[j - sugar[i]] != 5_001 { // 설탕 포대의 개수를 구할 수 있는 경우
            d[j] = min(d[j], d[j - sugar[i]] + 1)
        }
    }
}

if d[n] != 5_001 { // 결과를 구한 경우
    print(d[n])
} else {
    print(-1)
}
