import Foundation

let n: Int = Int(readLine()!)! // 테스트 케이스의 수 입력 받기

// 문장 입력 받기
var sentences: [String] = []
for _ in 0..<n {
    sentences.append(readLine()!)
}

for i in 0..<sentences.count {
    sentences[i] = sentences[i][sentences[i].startIndex].uppercased() + // 첫 글자를 대문자로 바꾼 후
        sentences[i][sentences[i].index(sentences[i].startIndex, offsetBy: 1)..<sentences[i].endIndex] // 나머지 글자 그대로 더해서 대입
}
sentences.forEach { print($0) } // 결과값 출력
