import Foundation

// 입력받을 정수 N개 입력 받기
let n = Int(readLine()!)!
// N개의 정수 입력 받기{
let array = readLine()!.split(separator: " ")
    .map { Int($0)! }.sorted()
// 결과 답안 출력
print(array.first!, array.last!)
