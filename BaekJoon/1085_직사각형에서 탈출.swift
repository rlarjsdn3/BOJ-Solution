import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let x: Int = input[0]
let y: Int = input[1]
let w: Int = input[2]
let h: Int = input[3]
print(min(min(x, w-x), min(y, h-y)))
