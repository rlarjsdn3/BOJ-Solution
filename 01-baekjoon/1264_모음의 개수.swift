import Foundation

extension String {
    func getGivenWordCount(_ regex: String) -> Int {
        do {
            let regex: NSRegularExpression = try NSRegularExpression(
                pattern: regex,
                options: []
            )
            let results: [NSTextCheckingResult] = regex.matches(
                in: self,
                options: [],
                range: NSRange(self.startIndex..., in: self)
            )
            
            return results.count
        } catch let error {
            print(error.localizedDescription)
        }
        
        return 0
    }
}

var result: [Int] = []
// 문자열을 입력받아 모음의 개수를 구하는 로직
while true {
    let input: String = readLine()!
    if input == "#" { break }
    result.append(input.getGivenWordCount("[aeiouAEIOU]"))
}
result.forEach { print($0) } // 결과값 출력하기
