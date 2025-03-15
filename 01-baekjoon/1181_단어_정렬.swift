import Foundation

// 단어의 개수 N 입력 받기
let n = Int(readLine()!)!
// 중복없이 N개의 단어 입력 받기
var array = Set<String>()
for _ in 0..<n {
    array.insert(readLine()!)
}
// 문자열을 정해진 기중에 따라 정렬
let result = array.sorted {
    if $0.count == $1.count {
        return $0 < $1
    }
    return $0.count < $1.count
}
// 답안 결과 출력
result.forEach { print($0) }
