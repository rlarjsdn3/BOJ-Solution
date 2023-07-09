import Foundation

// 점의 개수 T 입력 받기
let t = Int(readLine()!)!
// 점의 위치 정보 입력 받기
var points = [(x: Int, y: Int)]()
for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    points.append((input[0], input[1]))
}
// x축을 기준으로 내림차순 정렬하기
let xSort = points.sorted { $0.x > $1.x }
// y축을 기준으로 내림차순 정렬하기
let ySort = points.sorted { $0.y > $1.y }
// 결과값 계산하기
let result = (xSort[0].x - xSort[t-1].x) * (ySort[0].y - ySort[t-1].y)
// 결과값 출력
print(result)
