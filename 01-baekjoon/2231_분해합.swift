import Foundation

// 자연수 N 입력 받기
let n = Int(readLine()!)!

// 1부터 N까지 순회하며 분해합 계산하기
var result = 0
for m in 0..<n {
    // 분해합 구하기
    var d = m
    for n in String(m) {
        d += Int(n)!
    }
    // 분해합과 정수 N이 동일하다면
    if d == n {
        result = m // 생성자 할당 후, 순회 종료
        break
    }
}

print(result) // 결과 답안 출력

extension Int {
    init?(_ c: Character) {
        self.init(String(c))
    }
}
