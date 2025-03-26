import Foundation

// 회원의 수 N 입력 받기
let n = Int(readLine()!)!
// 회원의 나이와 이름을 공백으로 구분하여 입력 받기
var members = [(Int, String)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let age = Int(input[0])!, name = String(input[1])
    members.append((age, name))
}

// 나이가 낮은 순으로 정렬하기
members.sort {
    if $0.0 != $1.0 { // 나이가 다르면
        return $0.0 < $1.0
    }
    return false
}
// 결과 답안 출력
members.forEach { print($0.0, $0.1) }
