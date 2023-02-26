import Foundation

// 양의 정수 N 입력 받기
let n = Int(readLine()!)!

// 별 찍기! (상단)
for i in stride(from: 1, through: n, by: 1) {
    print(String(repeating: " ", count: n - i) + // 공백 출력
          String(repeating: "*", count: 2 * i - 1)) // 별 출력
}

// 별 찍기! (하단)
for i in stride(from: n - 1, through: 1, by: -1) {
    print(String(repeating: " ", count: n - i) + // 공백 출력
          String(repeating: "*", count: 2 * i - 1)) // 별 출력
}

