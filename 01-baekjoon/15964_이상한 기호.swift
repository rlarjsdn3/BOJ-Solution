import Foundation

// 정수 A, B 입력 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (a, b): (Int, Int) = (input[0], input[1])

// A@B 연산 결과 구하고, 출력하기
print((a+b) * (a-b))
