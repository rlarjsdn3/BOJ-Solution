import Foundation

// 바구니의 개수 N과 공을 넣을 횟수 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

// N개의 바구니에 N번 공 넣기
var baskets = [0]
for i in 1...n {
    baskets.append(i)
}

// I번째와 J번째 바구니의 공을 역순으로 뒤집기
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, j) = (input[0], input[1])
    if i == j { continue }
    
    for x in 1...(j-i) {
        for y in i...(j-x) {
            baskets.swapAt(y, y+1)
        }
    }
}

// 결과 답안 출력
for i in 1...n {
    print(baskets[i], terminator: " ")
}
