import Foundation

// 수열의 개수 N과 정수 X 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, x) = (input[0], input[1])
// N개의 수열 입력 받기
let array = readLine()!.split(separator: " ").map { Int($0)! }

// 결과 답안 출력
array.filter { $0 < x }
    .forEach { print($0, terminator: " ") }
