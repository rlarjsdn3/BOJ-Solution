import Foundation

// 다이얼 전화기의 문자(Key)와 해당 숫자를 거는 데 걸리는 시간(Value)
let dials = ["ABC": 3, "DEF": 4, "GHI": 5, "JKL": 6,
            "MNO": 7, "PQRS": 8, "TUV": 9, "WXYZ": 10]

// 문자열 S 입력 받기
let alpha = readLine()!
// 문자열을 순회하며 다이얼에 해당하는 키값 검색 및 시간 계산하기
var result = 0
for c in alpha {
    let s = String(c)
    for dial in dials where dial.key.contains(s) {
        result += dial.value
    }
}
// 결과 답안 출력
print(result)
