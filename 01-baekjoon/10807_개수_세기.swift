import Foundation

// 배열의 개수 N 입력 받기
let n = Int(readLine()!)!
// 정수 배열 입력 받기
let array = readLine()!.split(separator: " ").map { Int($0)! }
// 찾고자 하는 정수 V 입력 받기
let v = Int(readLine()!)!

// 결과 답안 출력
let result = array.filter { $0 == v }.count
print(result)
