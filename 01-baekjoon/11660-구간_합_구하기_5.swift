
import Foundation

// 2차원 배열의 크기 N과 질의 개수 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var array2D = [[Int]]()
// 2치원 배열 입력 받기
for _ in 0..<n {
    array2D.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var hapArray2D = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
// 2차원 합 배열 만들기
for i in 1...n {
    for j in 1...n {
        hapArray2D[i][j] = hapArray2D[i][j-1] + hapArray2D[i-1][j] - hapArray2D[i-1][j-1] + array2D[i-1][j-1]
    }
}

// 결과값을 저장할 배열
var result = [Int]()
// (x1, y1) ~ (x2, y2)범위의 구간 합 구하기
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])
    
    let total = hapArray2D[x2][y2] - hapArray2D[x1-1][y2] - hapArray2D[x2][y1-1] + hapArray2D[x1-1][y1-1]
    result.append(total)
}
// 결과값 출력하기
result.forEach {
    print($0)
}
