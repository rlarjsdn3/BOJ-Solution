import Foundation

// 테스트 케이스의 수 T 입력 받기
let t = Int(readLine()!)!
for _ in 0..<t {
    // 테스트 케이스의 수 만큼 반복 횟수 R과 문자열 S 입력 받기
    let input = readLine()!.split(separator: " ")
    let (r, s) = (Int(input[0])!, input[1])
    // 각 문자를 R만큼 순회하며 문자열 더하기
    var result = ""
    for c in s {
        result += String(repeating: c, count: r)
    }
    print(result) // 결과 답안 출력
}
