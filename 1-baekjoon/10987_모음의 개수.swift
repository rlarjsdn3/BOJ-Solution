import Foundation

// 단어 하나 입력 받기
let input: String = readLine()!

// 모음의 개수 세기
var count: Int = 0
for c in input {
    if ["a", "e", "i", "o", "u"].contains(c) {
        count += 1
    }
}
print(count) // 결과값 출력하기
