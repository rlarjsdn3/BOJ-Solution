import Foundation

extension Array where Element == Int {
    public func getRangeSum(_ index: ClosedRange<Int>) -> Int {
        let lower = index.lowerBound
        let upper = index.upperBound
        
        var result = 0
        for i in lower...upper {
            result += self[i]
        }
        return result
    }
}

// 시작 A와 끝 B 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (a, b) = (input[0], input[1])

// 수열 만들기
var i = 1
var sequence: [Int] = [0]
while sequence.count < 1_000 {
    for _ in 0..<i {
        sequence.append(i)
    }
    i += 1
}

// 결과값 출력하기
print(sequence.getRangeSum(a...b))
