import Foundation

// 정수 N 입력 받기
var n: [String] = Array(readLine()!).map { String($0) }

// 가장 큰 수부터 작은 수로 정렬하고, 합치기 (내림차순)
let value: [String] = n.sorted { $0 > $1 }

// 결과 출력하기
if value.map({ Int($0)! }).reduce(0, +) % 3 == 0 && value[value.count-1] == "0" {
    print(value.joined())
} else {
    print(-1)
}
