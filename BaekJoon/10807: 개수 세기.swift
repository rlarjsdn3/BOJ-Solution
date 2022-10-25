import Foundation

let n: Int = Int(readLine()!)!
let m: [Int] = readLine()!.components(separatedBy: " ").map {
    Int($0)!
}
let v: Int = Int(readLine()!)!

var count: Int = 0
m.forEach {
    if $0 == v {
        count += 1
    }
}

print(count)
