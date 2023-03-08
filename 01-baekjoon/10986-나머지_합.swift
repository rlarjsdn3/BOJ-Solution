import Foundation

// 수열의 개수 N과 나누는 수 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 수열의 정보 입력 받기
let array = readLine()!.split(separator: " ").map { Int(String($0))! }
// 결과값을 저장할 변수
var result = 0

var hArray = [Int]()
// 합 배열 계산하기
for i in array {
    hArray.append((hArray.last ?? 0) + i)
}

var rArray = [Int](repeating: 0, count: m)
// 나머지 배열 계산하기
for i in hArray {
    var remainder = i % m
    if remainder == 0 {
        result += 1
    }
    rArray[remainder] += 1
}

// 경우의 수 계산하기
for i in rArray {
    result += (i * (i-1)) / 2
}

// 결과값 출력하기
print(result)
