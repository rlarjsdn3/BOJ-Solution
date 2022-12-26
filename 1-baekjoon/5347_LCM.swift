import Foundation

// 유클리드 호제법으로 최대공약수 구하기
func gcd(_ a: Int, _ b: Int) -> Int {
    if a == 0 { return b
    } else { return gcd(b % a, a) }
}

let n: Int = Int(readLine()!)!
var result: [Int] = []
for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    result.append((input[0] * input[1]) / gcd(input[0], input[1])) // 최소공배수를 구해 result 변수에 저장
}
result.forEach { print($0) } // 결과 출력
