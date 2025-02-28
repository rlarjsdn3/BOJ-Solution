import Foundation

// N바이트 정수 입력 받기
let n = Int(readLine()!)!

// 답안 결과 출력
var result = ""
for _ in stride(from: 4, through: n, by: 4) {
    result += "long "
}
result += "int"
print(result)
