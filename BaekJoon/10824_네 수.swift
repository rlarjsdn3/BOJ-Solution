import Foundation

let input: [String] = readLine()!.split(separator: " ").map { String($0) }
print(Int(input[0] + input[1])! + Int(input[2] + input[3])!)
