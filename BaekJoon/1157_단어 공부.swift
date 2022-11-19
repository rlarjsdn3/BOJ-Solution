import Foundation

let input: [String] = Array(readLine()!).map { String($0.uppercased()) }
var countOfAlphabet: [Int] = [Int](repeating: 0, count: 26)

var maxValue: Int = 0
var maxIndex: Int = 0
var isRepeated: Bool = false

for s in input {
    countOfAlphabet[Int(UnicodeScalar(s)!.value)-65] += 1
}

for (n, x) in countOfAlphabet.enumerated() {
    if maxValue == x {
        isRepeated = true
    } else {
        if maxValue < x {
            maxValue = x
            maxIndex = n
            isRepeated = false
        }
    }
}

print(isRepeated ? "?" : UnicodeScalar(maxIndex+65)!.description)
