import Foundation

// 바구니의 개수 N과 공을 넣을 횟수 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

// I~J번째 바구니에 K번 공 넣기
var baskets = [Int](repeating: 0, count: n + 1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, j, k) = (input[0], input[1], input[2])
    
    for n in i...j {
        baskets[n] = k
    }
}
// 결과 답안 출력
for i in 1...n {
    print(baskets[i], terminator: " ")
}
