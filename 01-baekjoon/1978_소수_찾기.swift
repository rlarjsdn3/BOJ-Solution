import Foundation

// 정수의 개수 N 입력 받기
let n = Int(readLine()!)!
// N개의 정수 입력 받기
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

// 정수를 순회하며 소수인지 아닌지 판별하기
var result = 0
for n in numbers {
    if n <= 1 { continue } // N이 1이라면 건너뛰기
    
    var isPrime = true
    
    if n > 3 {
        let sqrt = sqrt(Double(n))
        for m in 2...Int(sqrt) {
            if n % m == 0 {
                isPrime = false
                break
            }
        }
    }
    if isPrime { result += 1 }
}
// 결과 답안 출력
print(result)
