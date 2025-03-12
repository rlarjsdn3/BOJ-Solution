import Foundation

// 물건의 총 개수 N 입력 받기
let n = Int(readLine()!)!
// 물건의 목록 List 입력 받기
var list = readLine()!

// 문자열을 순회하면서 pPAp 찾기
var result = 0
while let range = list.range(of: "pPAp") {
    result += 1
    list.removeSubrange(list.startIndex..<range.upperBound)
}
// 결과 답안 출력
print(result)
