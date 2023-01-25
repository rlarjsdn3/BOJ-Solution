import Foundation

extension String {
    public subscript(range: Range<Int>) -> String {
        let lower: String.Index = self.index(self.startIndex, offsetBy: range.lowerBound)
        let upper: String.Index = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[lower..<upper])
    }
}

// 단어 입력 받기
let word: String = readLine()!

// 단어를 세 부분으로 나누기
var result: [String] = []
for i in 1..<word.count {
    for j in (i+1)..<word.count {
        result.append(String(word[0..<i].reversed())
                      + String(word[i..<j].reversed())
                      + String(word[j..<word.count].reversed()))
    }
}

// 단어 정렬하기
result.sort(by: <)

// 결과값 출력하기
print(result[0])
