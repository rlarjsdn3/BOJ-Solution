import Foundation

// 정수 N과 M 입력 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m): (Int, Int) = (input[0], input[1])

print(abs(n - m)) // 결과 출력
