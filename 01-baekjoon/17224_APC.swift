import Foundation

// 문제의 개수 N, 역량 L, 최대 개수 K 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, l, k) = (input[0], input[1], input[2])
// N개의 문제 정보 입력 받기
var subs = [(Int, Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    subs.append((input[0], input[1]))
}

var result = 0 // 점수 저장
var solved = 0 // 푼 문제 수

// 문제들을 sub2를 기준으로 오름차순 정렬
subs.sort(by: { $0.1 < $1.1 })

for i in 0..<n {
    // 풀 수 있는 최대 문제 개수에 도달하면
    if solved >= k {
        break
    }
    
    // 어려운 문제를 풀 수 있다면
    if l >= subs[i].1 {
        solved += 1
        result += 140
    // 쉬운 문제를 풀 수 있다면
    } else if l >= subs[i].0 {
        solved += 1
        result += 100
    }
}

print(result) // 결과 답안 출력
