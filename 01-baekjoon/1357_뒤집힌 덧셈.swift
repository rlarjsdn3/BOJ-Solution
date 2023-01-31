import Foundation

// 정수 X와 Y 입력 받기
let input: [String] = readLine()!.split(separator: " ").map { String($0) }
let (x, y): (String, String) = (input[0], input[1])

// 뒤집힌 덧셈 후 결과값 출력하기
print(Int(String(String(Int(String(x.reversed()))! + Int(String(y.reversed()))!).reversed()))!)
