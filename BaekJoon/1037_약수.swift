import Foundation

let n: Int = Int(readLine()!)!
var divisor: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
print(divisor[0] * divisor[divisor.count-1])
