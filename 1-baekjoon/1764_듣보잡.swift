import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var set1: Set<String> = Set<String>()
var set2: Set<String> = Set<String>()

for _ in 0..<n {
    set1.insert(readLine()!)
}
for _ in 0..<m {
    set2.insert(readLine()!)
}

let result: [String] = Array(set1.intersection(set2)).sorted()
print(result.count)
result.forEach { print($0) }
