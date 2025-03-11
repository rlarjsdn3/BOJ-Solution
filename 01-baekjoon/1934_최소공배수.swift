import Foundation

// 유클리드 호제법
func gcd(_ a: Int, _ b: Int) -> Int {
    if b != 0 {
        return gcd(b, a % b)
    }
    return a
}

// 테스트 케이스의 수 T 입력 받기
let t = Int(readLine()!)!
for _ in 0..<t {
    // 정수 A, B 입력 받기
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (input[0], input[1])
    // 최소공배수(LCM) 구하기
    print((a * b) / gcd(a, b))
}
