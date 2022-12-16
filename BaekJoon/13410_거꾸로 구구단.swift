import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k): (Int, Int) = (input[0], input[1])

var result: Int = 0
for i in 0...k {
    let tmp: Int = Int(String(String(n * i).reversed()))! // 숫자 반전
    result = max(result, tmp) // 최대값 저장
}
print(result) // 결과값 출력
