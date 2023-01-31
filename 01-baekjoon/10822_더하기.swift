import Foundation

let input: [Int] = readLine()!.split(separator: ",").map { Int(String($0))! }
var result: Int = 0
for i in input {
    result += i
}
print(result)
