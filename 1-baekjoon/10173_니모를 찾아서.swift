import Foundation

// 문자열 입력 받기
var input: String
var array: [String] = []
repeat {
    input = readLine()!
    array.append(input)
} while input != "EOI"

// 문자열에 'Nemo' 문자열이 포함되어 있는지 확인하기
let pattern: String = #".*[n|N][e|E][m|M][o|O].*$"#

var result: [String] = []
for i in 0..<array.count-1 {
    let match = array[i].range(
        of: pattern,
        options: .regularExpression
    )
    
    result.append(match != nil ? "Found" : "Missing")
}
result.forEach { print($0) } // 결과값 출력하기
