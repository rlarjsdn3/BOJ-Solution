import Foundation

let n: Int = Int(readLine()!)!
var string: [[String]] = []
for _ in 0..<n {
    string.append(readLine()!.split(separator: " ").map { String($0) })
}

for i in 0..<n {
    print("Case #\(i+1): \(string[i].reversed().joined(separator: " "))")
}
