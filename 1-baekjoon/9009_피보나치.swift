import Foundation

// 1,000,000,000까지 피보나치 수 구하기(다이내믹 프로그래밍)
var fibo: [Int] = [0, 1]
for i in 2..<45 {
    fibo.append(fibo[i-1] + fibo[i-2])
}

// 테스트 케이스의 수 T 입력 받기
let t: Int = Int(readLine()!)!

// T개의 정수 N 입력 받고, 결과 저장하기
var result: [[Int]] = [[Int]](repeating: [Int](), count: t)
for i in 0..<t {
    var n: Int = Int(readLine()!)!

    for s in stride(from: 44, to: 0, by: -1) {
        if n >= fibo[s] {
            n -= fibo[s]
            result[i].append(fibo[s])

            if n == 0 { break }
        }
    }
}

// 결과값 정렬하고, 출력하기
for i in 0..<t {
    result[i].sort()
}

for i in 0..<t {
    print(result[i].map { String($0) }.joined(separator: " "))
}
