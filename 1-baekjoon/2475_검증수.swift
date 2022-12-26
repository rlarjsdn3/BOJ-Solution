import Foundation

let n: [Int] = Array(readLine()!.components(separatedBy: " ")).map { Int($0)! }

var sum: Int = 0
for x in n {
    sum += Int(pow(Double(x), 2.0))
}
print(sum % 10)
