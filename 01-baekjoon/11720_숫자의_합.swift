import Foundation

// 숫자의 개수 N 입력받기
let n = readLine()!
// 숫자 N개 입력받기
let string = readLine()!

// N개의 숫자를 순회하며 더하기
var result = 0
for c in string {
    result += Int(c.asciiValue! - 48)
}
// 결과답안 출력
print(result)
