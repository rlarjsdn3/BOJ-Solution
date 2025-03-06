import Foundation

// 정수 N과 위치 K 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])

// 1부터 N까지 순회하며 약수 찾기
var count = 0
var result = 0
for i in 1...n {
    if n % i == 0 {
        count += 1
        
        // 찾은 횟수가 목표 횟수와 일치하면
        if count == k {
            result = i
            break
        }
    }
}
print(result) // 결과 답안 출력
