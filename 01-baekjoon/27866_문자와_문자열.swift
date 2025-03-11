import Foundation

// 문자열 S 입력받기
let s = readLine()!
// 위치 I 입력받기
let i = Int(readLine()!)!
// 결과 답안 출력
print(s[s.index(s.startIndex, offsetBy: i - 1)])
