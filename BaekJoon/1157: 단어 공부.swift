import Foundation

var input: [String] = Array(readLine()!.uppercased()).map { String($0) }
var count: [Int] = [Int](repeating: 0, count: 26)

for c in input {
    count[Int(Unicode.Scalar(c)!.value)-65] += 1
}

var maxIndex: Int = 0
var maxValue: Int = 0
var repeated: Bool = false
for (n, x) in count.enumerated() {
    if maxValue != x {
        if maxValue < x {
            maxValue = x
            maxIndex = n
            repeated = false
        }
    } else {
        repeated = true
    }
}

print(repeated ? "?" : String(Unicode.Scalar(65+maxIndex)!))
