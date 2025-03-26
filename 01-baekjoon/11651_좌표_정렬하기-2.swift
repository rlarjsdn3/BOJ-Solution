import Foundation

// 좌표의 수 N 입력 받기
let n = Int(readLine()!)!
// N개 만큼 좌표 입력 받기
var points = [(Int, Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    points.append((input[0], input[1]))
}

// 좌표 정렬하기
points.sort {
    if $0.1 != $1.1 { // Y 좌표가 다르면
        return $0.1 < $1.1
    }
    return $0.0 < $1.0
}
// 결과 답안 출력
points.forEach { print($0.0, $0.1) }
