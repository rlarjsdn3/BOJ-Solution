import Foundation

// 지불한 돈 입력받기
let input = Int(readLine()!)!

var changes = 1_000 - input
let coinTypes = [500, 100, 50, 10, 5, 1]
var result = 0
// 액면가가 높은 동전부터 개수 세아리기
for coinType in coinTypes {
    result += (changes / coinType)
    changes %= coinType
}

print(result) // 최종 답안 출력
