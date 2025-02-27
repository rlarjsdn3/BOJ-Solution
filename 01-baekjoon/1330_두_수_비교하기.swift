import Foundation

// A, B 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b) = (input[0], input[1])

// 대수 비교하기
if a > b {
    print(">")
} else if a < b {
    print("<")
} else {
    print("==")
}
