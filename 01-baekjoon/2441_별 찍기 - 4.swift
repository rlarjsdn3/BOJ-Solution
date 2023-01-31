import Foundation

// 정수 N 입력 받기
let n: Int = Int(readLine()!)!

// 별 찍기
for i in 0..<n {
    print(String(repeating: " ", count: i), terminator: "")
    print(String(repeating: "*", count: n - i))
}
