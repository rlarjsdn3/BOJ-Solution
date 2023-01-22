import Foundation

// 테스트 케이스의 수 T 입력 받기
var t: Int = Int(readLine()!)!
// T개의 정수 K 입력 받기
var k: [Int] = []
for _ in 0..<t {
    k.append(Int(readLine()!)!)
}

// 에라토스테네스의 체 알고리즘 수행
var eratos: [Bool] = [Bool](repeating: true, count: 100_001)
eratos[1] = false

for i in 2..<Int(sqrt(100_001)) {
    var j: Int = 2
    while i * j < 100_001 {
        eratos[i * j] = false
        j += 1
    }
}

// 가장 작은 소수의 짝곱 찾아, 결과값 저장하기
var result: [Int] = []

for e in k {
    var minValue: Int = 100_001

    for i in 0..<100_001 {
        if !eratos[i] {
            continue
        }

        for j in (i+1)..<100_001 {
            if !eratos[j] {
                continue
            }

            if i * j >= e {
                minValue = min(i * j, minValue); break
            }
        }
    }

    result.append(minValue)
}
result.forEach { print($0) } // 결과값 출력하기
