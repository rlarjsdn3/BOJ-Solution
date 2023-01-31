import Foundation

// 정수 N과 M 입력 받기
let n: Int = Int(readLine()!)!
let m: Int = Int(readLine()!)!

// 에라토스네테스의 체 알고리즘 수행하기
var eratos: [Bool] = [Bool](repeating: true, count: 10_001)

eratos[1] = false // 1은 소수가 아님!

for i in 2...Int(sqrt(Double(10_001))) {
    var k: Int = 2
    if eratos[i] {
        while i * k <= 10_000 {
            eratos[i * k] = false
            k += 1
        }
    }
}

// 주어진 범위의 소수의 합과 최솟값 구하기
var sumValue: Int = 0
var minValue: Int = 10_001

for i in n...m {
    if eratos[i] {
        sumValue += i
        minValue = min(minValue, i)
    }
}

// 결과값 출력하기
if sumValue != 0 { // 소수가 존재하는 경우
    print("\(sumValue)\n\(minValue)")
} else { // 소수가 존재하지 않는 경우
    print(-1)
}
