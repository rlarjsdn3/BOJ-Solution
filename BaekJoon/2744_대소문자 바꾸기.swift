import Foundation

var input: [Character] = Array(readLine()!)

var result: [String] = []
for c in input {
    if c.isLowercase { // 문자가 소문자이면
        result.append(c.uppercased()) // 대문자 삽입
    } else {
        result.append(c.lowercased()) // 소문자 삽입
    }
}
print(result.joined()) // 모두 합쳐서 결과 출력
