import Foundation

let n: Int = Int(readLine()!)!
var fibo: [Int] = [0, 1, 1]

// 다이내믹 프로그래밍으로 피보나치 수열 구하기
for i in stride(from: 3, through: n, by: 1) {
    fibo.append(fibo[i-1] + fibo[i-2])
}
print(fibo[n]) // 결과 출력
