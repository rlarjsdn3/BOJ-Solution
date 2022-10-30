import Foundation

var input: [Int] = []
for _ in 0..<5 {
    input.append(Int(readLine()!)!)
}

input.sort()
var median: Int = input[2]
var average: Int = input.reduce(0) { return $0 + $1 } / input.count

print(average)
print(median)
