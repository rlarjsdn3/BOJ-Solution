import Foundation

// 수의 개수 N 입력 받기
let n = Int(readLine()!)!
// N개만큼 수 입력 받기
var array = [Int]()
for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

// 오름차순으로 정렬하기
array.sort()
// 결과 답안 출력
array.forEach { print($0) }
