import Foundation

var input: Int = Int(readLine()!)!
var button: [Int] = [300, 60, 10]
var result: [Int] = [0, 0, 0]

for i in button.indices {
    result[i] += (input / button[i])
    input -= (button[i] * result[i])
}

if input == 0 {
    result.forEach { print($0, terminator: " ") }
} else {
    print("-1")
}
