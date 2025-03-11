import Foundation

// 테스트 케이스의 수 T 입력 받기
let t = Int(readLine()!)!
for _ in 0..<t {
    // 호텔의 층 수 H, 각 층의 방 수 W, N번째 손님 입력 받기
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (h, _, n) = (input[0], input[1], input[2])
    // 호실 계산하기
    let hosil = (n % h == 0) ? (n / h) : (n / h + 1)
    // 층수 계산하기
    let floor = (n % h == 0) ? h : (n % h)
    // 결과 답안 출력
    print((floor * 100) + hosil)
}
