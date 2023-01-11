import Foundation

// 테스트 케이스의 수 T 입력 받기
let t: Int = Int(readLine()!)!

// 결과를 저장하기 위한 변수
var result: [(Int, Int)] = []

// 계산된 결과를 저장하기 위한 DP 테이블 선언
var d: [(Int, Int)] = [(Int, Int)](repeating: (0, 0), count: 41)

// 다이내믹 프로그래밍 수행(바텀업)
d[0] = (1, 0)
d[1] = (0, 1)
d[2] = (1, 1)

var prev: Int = 3
for _ in 0..<t {
    let input: Int = Int(readLine()!)!
    
    // 해당 값의 결과를 구하지 않았고, 3보다 큰 경우
    if input > 2 {
        for i in stride(from: prev, through: input, by: 1) {
            d[i] = (d[i-1].0 + d[i-2].0, d[i-1].1 + d[i-2].1)
        }
        prev = input
    }
    
    result.append( (d[input].0, d[input].1) )
}
result.forEach { // 결과값 출력하기
    print("\($0.0) \($0.1)")
}
