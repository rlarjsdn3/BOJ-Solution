import Foundation

let n: [Int] = Array(readLine()!.components(separatedBy: " ")).map { Int($0)! }

var isAscending: Bool = false
var isDescending: Bool = false

for i in 1..<n.count {
    if n[i-1] < n[i] {
        isAscending = true
    } else {
        isDescending = true
    }
}
print((isAscending && isDescending) ? "mixed" : (isAscending ? "ascending" : "descending"))
