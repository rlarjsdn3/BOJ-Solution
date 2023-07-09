import Foundation

// 테스트 케이스의 개수 T 입력 받기
let t = Int(readLine()!)!
// 거슬러줘야 할 동전의 개수 구하기
for _ in 0..<t {
    // 거스름돈 입력 받기
    var change = Int(readLine()!)!
    // 결과값을 저장할 변수 선언
    var result = [Int]()
    // 거슬러줘야 할 각 동전의 개수 구하기
    for coin in [25, 10, 5, 1] {
        result.append(Int(change / coin))
        change = Int(change) % coin
    }
    // 결과값 출력
    print(result.map { String($0) }.joined(separator: " "))
}
