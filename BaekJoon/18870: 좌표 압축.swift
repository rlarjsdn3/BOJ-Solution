import Foundation

let n: Int = Int(readLine()!)!
let grid: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var sortedGrid: [Int: Int] = [:]
for (n, x) in Set<Int>(grid).sorted().enumerated() {
    if !sortedGrid.keys.contains(x) {
        sortedGrid[x] = n
    }
}

for n in grid {
    print("\(sortedGrid[n]!)", terminator: " ")
}
