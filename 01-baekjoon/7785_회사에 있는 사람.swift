import Foundation

// 출입 기록의 수 N 입력 받기
let n = Int(readLine()!)!
// 회사에 남아 있는 사람을 저장하는 집합 선언
var people = Set<String>()
// 출입 로그 정보 입력 받기
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let (name, log) = (input[0], input[1])
    // 회사에 출입하는 경우
    if log == "enter" {
        people.insert(name)
    // 회사에서 퇴근하는 경우
    } else {
        people.remove(name)
    }
}
// 결과값 출력하기
let result = people.map { String($0) }.sorted(by: { $0 > $1 })
result.forEach { print($0) }
