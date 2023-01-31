import Foundation

func hanoi(_ n: Int, from: Int, tmp: Int, to: Int,
           result: inout [(Int, Int)], count: inout Int) {
    if n == 1 {
        count += 1
        result.append((from, to))
    } else {
        hanoi(n-1, from: from, tmp: to, to: tmp, result: &result, count: &count)
        count += 1
        result.append((from, to))
        hanoi(n-1, from: tmp, tmp: from, to: to, result: &result, count: &count)
    }
}

var input: Int = Int(readLine()!)!

var count: Int = 0
var result: [(Int, Int)] = []
hanoi(input, from: 1, tmp: 2, to: 3, result: &result, count: &count)

print(count)
result.forEach { print("\($0.0) \($0.1)")}
