import Foundation

// 배열의 길이 n 입력 받기
let n: Int = Int(readLine()!)!

// A개의 수열 입력 받기
var a: [Int] = [0]
a.append(contentsOf: readLine()!.split(separator: " ").map { Int(String($0))! })

// 다이내믹 프로그래밍 수행(바텀업) - 시간 복잡도 O(n^2)
var d: [Int] = [Int](repeating: 0, count: n + 1)

var result: Int = 0
for i in 1...n {
    var count: Int = 0
    // d[0]~d[i-1]까지의 원소 중에서 i번째 원소보다 작으면서 가장 큰 d값 구하기
    for j in stride(from: 0, to: i, by: 1) {
        if a[i] > a[j] {
            count = max(d[j], count)
        }
        d[i] = count + 1 // (가장 큰 d값 + 1)
        result = max(d[i], result) // 가장 긴 부분수열의 개수 저장하기
    }
}
print(result) // 결과값 출력하기
