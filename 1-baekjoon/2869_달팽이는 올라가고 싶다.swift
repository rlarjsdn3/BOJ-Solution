import Foundation

// 정수 A, B, V 입력 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (a, b, v): (Int, Int, Int) = (input[0], input[1], input[2])

var result: Int = (v - b) / (a - b)
if (v - b) != (result * (a-b)) { // 마지막으로 올라가면 되는 경우
    result += 1
}
print(result) // 결과값 출력하기
