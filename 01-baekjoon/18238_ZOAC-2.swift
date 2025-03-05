import Foundation

// 문자열 입력 받기
let input = readLine()!

var curr = 0 // 가리키는 문자
var time = 0 // 문자열을 출력하는데 걸린 시간

for i in 0..<input.count {
    // 바꾸고자 하는 문자
    let target = input[i].indexValue
    // 현재 문자에서 다른 문자로 바꿀 때 드는 시간
    let t1 = abs(target - curr)
    let t2 = 26 - t1
    // 더 작게 소모되는 시간을 더하기
    if t1 < t2 {
        time += t1
    } else {
        time += t2
    }
    curr = target // 현재 문자 위치 갱신
}
print(time) // 결과 답안 출력

extension String {
    subscript(index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
extension Character {
    var indexValue: Int {
        Int(self.asciiValue!) - 65
    }
}

