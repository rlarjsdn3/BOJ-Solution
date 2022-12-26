import Foundation

let n: Int = Int(readLine()!)!

// 유클리드 호제법으로 최대공약수(GCD) 구하기
func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 {
        return b
    } else {
        return gcd(b, a % b)
    }
}

var result: [Int] = []
for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ")
                        .map { Int(String($0))! }.sorted(by: >)
    // (n * m) / k = 최소공배수
    result.append((input[0] * input[1]) / gcd(input[0], input[1]))
}
result.forEach { print($0) }
