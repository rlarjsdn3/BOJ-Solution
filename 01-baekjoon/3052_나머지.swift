import Foundation

// 나머지 결과 저장
var remainders = Set<Int>()
// 정수 N 10개 입력 받고, 결과 계산하기
for _ in 0..<10 {
    let n = Int(readLine()!)!
    remainders.insert(n % 42)
}
// 결과 답안 출력
print(remainders.count)
