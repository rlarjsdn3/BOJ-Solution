import Foundation

// 테스트 케이스의 수 T 입력 받기
let t: Int = Int(readLine()!)!

// T개의 정수 N 입력 받기
var n: [Int] = []
for _ in 0..<t {
    n.append(Int(readLine()!)!)
}

// 다이내믹 프로그래밍 수행
let size: Int = n.max()! + 1
var d: [Int] = [Int](repeating: 0, count: size)

d[1] = 1
d[2] = 1
d[3] = 1
d[4] = d[3] + d[1]
d[5] = d[4]
d[6] = d[5] + d[3]
d[7] = d[6] + d[2]
d[8] = d[7] + d[1]

for i in stride(from: 9, to: size, by: 1) {
    d[i] = d[i - 1] + d[i - 5]
}

// 결과값 출력하기
for i in n {
    print(d[i])
}
