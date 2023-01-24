import Foundation

// 수열의 길이 N 입력 받기
let n: Int = Int(readLine()!)!

// 수열 정보 입력 받고, 하계(lowerBound) 배열 선언
var lower: [Int] = []
let array: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

// lowerBound 함수
func lowerBound(_ find: Int) -> Int {
    var start: Int = 0, end: Int = lower.count - 1
    
    while start < end {
        let mid: Int = (start + end) / 2
        
        if find > lower[mid] {
            start = mid + 1
        } else {
            end = mid
        }
    }

    return end
}

// 가장 긴 증가하는 부분 수열 구하기(이진 탐색)
for e in array {
    if lower.isEmpty || lower.last! < e {
        lower.append(e)
    } else {
        lower[lowerBound(e)] = e
    }
}
print(lower.count) // 결과값 출력하기
