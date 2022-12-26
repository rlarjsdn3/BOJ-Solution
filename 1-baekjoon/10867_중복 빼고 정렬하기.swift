import Foundation

let n: Int = Int(readLine()!)!
var array: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
Set(array).sorted().forEach { print($0, terminator: " ") }
