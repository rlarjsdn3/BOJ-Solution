import Foundation

extension String {
    subscript(range index: Range<Int>) -> String {
        let startIndex: String.Index = self.index(self.startIndex, offsetBy: index.lowerBound)
        let endIndex: String.Index = self.index(self.startIndex, offsetBy: index.upperBound)
        return String(self[startIndex..<endIndex])
    }
}

let input: String = readLine()! // 검색 대상 문서 이름을 저장하는 변수
let search: String = readLine()! // 검색 명을 저장하는 변수

var i: Int = 0 // 문서 이름의 시작 절단 위치를 저장하는 변수
var result: Int = 0 // 결과값을 저장하는 변수

// 문서 이름의 시작 절단 위치가 문서 이름의 길이보다 작은 경우
while i < input.count {
    // 문서 이름 시작 절단 위치에서 문서 이름의 끝 중 검색 명이 접두어가 아닌 경우
    if !input[range: i..<input.count].hasPrefix(search) {
        i += 1 // 문서 이름 시작 절단 위치 한 칸 뒤로 이동
        continue
    }
    
    i += search.count // 문서 이름 시작 절단 위치를 옮긴 후
    result += 1 // 카운팅 하기
    
    // 검색 대상 길이가 검색 명 길이보다 작은 경우
    if (input.count - i) < search.count {
        break
    }
}
print(result) // 결과값 출력
