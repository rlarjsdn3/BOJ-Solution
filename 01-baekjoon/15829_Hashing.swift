import Foundation

// 문자열의 길이 l 입력 받기
let l = Int(readLine()!)!
// 해시로 변환할 문자열 입력 받기
let str = readLine()!

var r = 1
let m = 1_234_567_891

// 문자열을 해시 값으로 변환하기
var result: Int = 0
for w in str {
    result += w.ord * r; result %= m
    r *= 31; r %= m
}
print(result) // 결과 답안 출력

extension Character {
    var ord: Int {
        Int(self.asciiValue! - 96)
    }
}

