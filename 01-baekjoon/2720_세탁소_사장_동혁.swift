import Foundation

// 테스트 케이스의 개수 T 입력받기
let t = Int(readLine()!)!

for _ in 0..<t {
    // 거스름돈 C 입력받기
    var change = Int(readLine()!)!
    
    var result = [0, 0, 0, 0]
    let coinType = [25, 10, 5, 1]
    // 쿼터, 다임, 니켈, 페니 순으로 거슬러주기
    for (index, coinType) in coinType.enumerated() {
        result[index] = change / coinType
        change %= coinType
    }
    // 답안 결과 출력
    let answer = result.map { String($0) }.joined(separator: " ")
    print(answer)
}
