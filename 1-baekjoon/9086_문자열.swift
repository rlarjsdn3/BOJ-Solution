import Foundation

// 테스트 케이스의 수 T 입력 받기
let t: Int = Int(readLine()!)!
// t개의 문자열 입력 받기
var array: [String] = []
for _ in 0..<t {
    array.append(readLine()!)
}

// 결과값 출력
for i in 0..<t {
    print(String(array[i][array[i].startIndex]) +
            String(array[i][array[i].index(array[i].startIndex, offsetBy: array[i].count-1)]))
}
