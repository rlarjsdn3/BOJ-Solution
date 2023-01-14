import Foundation

// 문자열 입력 받기
let input: String = readLine()!

// A부터 Z까지 문자 배열 초기화하기
var caesar: [String] = []
for i in 0..<26 {
    caesar.append(String(UnicodeScalar(65 + i)!))
}

// 원래 문자로 변환하기
var result: [String] = []
for c in input {
    var ascii: Int = Int(c.asciiValue!) - 65 - 3
    if ascii < 0 {
        ascii = 26 + ascii
    }
    result.append(caesar[ascii])
}
print(result.joined()) // 결과값 출력하기
