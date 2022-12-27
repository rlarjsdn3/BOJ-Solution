import Foundation

// 테스트 케이스의 수 T 입력 받기
let t: Int = Int(readLine()!)!

// 결과를 저장할 배열 선언
var result: [Int] = []

// 다이내믹 프로그래밍 수행(바텀업)
for _ in 0..<t {
    // 각 거주민의 층 수 K와 호 수 N 입력 받기
    let k: Int = Int(readLine()!)!
    let n: Int = Int(readLine()!)!
    
    // 계산된 값을 저장하는 2차원 DP 테이블 선언
    var d: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: k + 1)
    
    // 0층 i호까지 거주민 초기화하기
    for i in 1...n {
        d[0][i] = i
    }
    
    for i in 1...k {
        var total: Int = 0 // 총 거주민을 저장하는 변수
        for j in 1...n {
            total += d[i-1][j]
            d[i][j] = total
        }
    }
    
    result.append(d[k][n])
}
result.forEach { print($0) } // 결과값 출력
