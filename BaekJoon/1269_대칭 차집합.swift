import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
var set: [Set<Int>] = [Set<Int>(), Set<Int>()]
for i in 0..<2 {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    for e in input {
        set[i].insert(e)
    }
}
print(Array(set[0].symmetricDifference(set[1])).count)
