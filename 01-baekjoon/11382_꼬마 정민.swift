import Foundation

let result = readLine()!.split(separator: " ")
    .map { UInt64($0)! }
    .reduce(0, +)
print(result)
