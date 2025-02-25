import Foundation

// 요리시간 T 입력받기
var t = Int(readLine()!)!

var result = [0, 0, 0]
let buttonTypes = [300, 60, 10]

// A버튼부터 C버튼까지 차례로 버튼 조작 횟수 구하기
for (index, buttonType) in buttonTypes.enumerated() {
    result[index] = t / buttonType
    t %= buttonType
}

// T초로 맞추기 힘들다면
if t > 0 {
    print(-1)
} else {
    print(result.map { String($0) }.joined(separator: " "))
}
