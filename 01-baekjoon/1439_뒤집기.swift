import Foundation

// 문자열 S 입력 받기
let s = readLine()!

// 해당하는 연속된 문자열 개수를 저장
var count0 = 0
var count1 = 0

// 두 번째 문자열을 순회하면서 연속된 문자열 개수 찾기
for i in 1...s.count-1 {
    if s[i-1] == "0" && s[i] == "1" {
        count1 += 1
    } else if s[i-1] == "1" && s[i] == "0" {
        count0 += 1
    }
}
// 맨 앞 요소가 어느 문자열인지 확인하기
if s[0] == "0" {
    count0 += 1
} else {
    count1 += 1
}

// 결과 답안 출력
print(min(count0, count1))



extension String {
    subscript(index: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: index)]
    }
}
