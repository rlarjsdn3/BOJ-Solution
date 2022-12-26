import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
print(input[0] + input[1] + input[2])
