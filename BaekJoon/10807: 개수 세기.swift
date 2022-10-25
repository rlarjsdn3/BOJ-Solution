import Foundation

let n: Int = Int(readLine()!)!
let m: [Int] = readLine()!.components(separatedBy: " ").map {
    Int($0)!
}
let v: Int = Int(readLine()!)!

var count: Int = 0
for x in m {
    if x == v {
        count += 1
    }
}

print(count)
