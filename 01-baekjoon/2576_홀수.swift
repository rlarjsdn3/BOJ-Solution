import Foundation

var input: [Int] = []
for _ in 0..<7 {
    input.append(Int(readLine()!)!)
}

var odd: [Int] = input.filter { $0 % 2 == 1 }
if !odd.isEmpty {
    print(odd.reduce(0, +))
    print(odd.min()!)
} else {
    print(-1)
}
