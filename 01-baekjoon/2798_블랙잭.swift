import Foundation

// 카드의 개수 N, 목표 숫자 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
// 카드 숫자 입력 받기
let array = readLine()!.split(separator: " ").map { Int($0)! }

// 모든 카드를 살펴보며 합 구하기
var sumOfArray = [Int]()
for i in 0..<n {
    for j in (i+1)..<n {
        for k in (j+1)..<n {
            let sum = array[i] + array[j] + array[k]
            sumOfArray.append(sum)
        }
    }
}

// 결과 답언 출력
let result = sumOfArray.sorted { abs($0 - m) < abs($1 - m) }
    .filter { $0 <= m }.first!
print(result)
