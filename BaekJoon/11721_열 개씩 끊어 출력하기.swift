import Foundation

var input: String = readLine()!
for i in 0..<input.count {
    if i != 0 && i % 10 == 0 { print() }
    print(input[input.index(input.startIndex, offsetBy: i)], terminator: "")
}
