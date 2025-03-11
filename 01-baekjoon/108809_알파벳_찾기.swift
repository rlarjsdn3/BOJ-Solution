import Foundation

// 단어 s 입력 받기
let s = readLine()!

// 문자열을 순회하면서 단어의 위치 찾기
var result = [Int](repeating: -1, count: 26)
for (index, c) in s.enumerated() {
    let pos = Int(c.asciiValue!) - 97
    // 처음 등장하는 단어라면
    if result[pos] == -1 {
        result[pos] = index
    }
}
result.forEach { print($0, terminator: " ") } // 결과 답안 출력
