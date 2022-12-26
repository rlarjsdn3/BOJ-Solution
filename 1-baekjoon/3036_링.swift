import Foundation

// 유클리드 호제법을 구현한 함수
func euclid(_ a: Int, _ b: Int) -> Int {
    var a: Int = a
    var b: Int = b
    
    if a > b {
        swap(&a, &b)
    }
    
    if a == 0 { return b }
    else { return euclid(b%a, a) }
}

let n: Int = Int(readLine()!)!
let ring: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

var result: [(Int, Int)] = []
for i in 1..<ring.count {
    let gcd: Int = euclid(ring[0], ring[i])
    result.append((ring[0]/gcd, ring[i]/gcd))
}
result.forEach { print("\($0.0)/\($0.1)") } // 결과값 출력
