import Foundation

var n: Int = Int(readLine()!)!

var array: [[Int]] = []
for _ in 0..<n {
    array.append(Array(readLine()!.split(separator: " ").map { Int(String($0))! }))
}

// 각 배열 요소 정렬
for i in 0..<n {
    array[i].sort(by: >)
}

// 결과 출력
for i in 0..<n {
    print(array[i][2])
}
