import Foundation

// 유클리드 호제법
func gcd(_ a: Int, _ b: Int) -> Int {
    if b != 0 { return gcd(b, a % b) }
    return a
}

// 두 개의 정수 A, B 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b) = (input[0], input[1])

// 결과 답안 출력
let g = gcd(a, b)
print(g) // 최대공약수
print((a * b) / g) // 최소공배수
