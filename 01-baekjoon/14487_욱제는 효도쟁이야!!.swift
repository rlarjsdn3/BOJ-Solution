import Foundation

// 마을의 수 N 입력 받기
let n: Int = Int(readLine()!)!

// N개의 마을 간 이동 거리 입력 받기
var dist: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

// 결과값 출력하기
print(dist.reduce(0, +) - dist[n - 1])
