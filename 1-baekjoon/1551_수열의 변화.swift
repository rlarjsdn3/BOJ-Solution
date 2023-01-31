import Foundation

// 수열의 크기 N과 K 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (input[0], input[1])
// 수열의 정보 입력 받기
var array = readLine()!.split(separator: ",").map { Int(String($0))! }

// 수열 구하기
for i in stride(from: 1, through: k, by: 1) {
    var tmp: [Int] = []
    for j in stride(from: 0, to: n-i, by: 1) {
        tmp.append(array[j+1]-array[j])
    }
    array = tmp
}

// 결과값 출력하기
print(array.map { String($0) }.joined(separator: ","))
