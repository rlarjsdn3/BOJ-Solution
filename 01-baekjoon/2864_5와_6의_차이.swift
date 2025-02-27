import Foundation

// A, B 입력 받기
let input = readLine()!.split(separator: " ")
let (a, b) = (input[0], input[1])

// 가장 큰 수와 가장 작은 수 구하기
var maxA = a.replacingOccurrences(of: "5", with: "6")
var maxB = b.replacingOccurrences(of: "5", with: "6")
var minA = a.replacingOccurrences(of: "6", with: "5")
var minB = b.replacingOccurrences(of: "6", with: "5")

let minValue = minA.toInt() + minB.toInt()
let maxValue = maxA.toInt() + maxB.toInt()
print(minValue, maxValue) // 답안 결과 출력하기

extension String {
    func toInt() -> Int { Int(self)! }
}

