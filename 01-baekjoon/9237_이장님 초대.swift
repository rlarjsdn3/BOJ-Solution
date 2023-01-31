import Foundation

// 묘묙의 개수 N 입력 받기
let n: Int = Int(readLine()!)!

// 각 나무의 정보 입력 받기
let t: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: >)

// 그리디 알고리즘 수행
var result: Int = -1

for i in 0..<n {
    result = max(i + t[i] + 2, result)
}
print(result) // 결과값 출력하기
