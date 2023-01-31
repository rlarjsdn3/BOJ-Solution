import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let k: Int = input[0]
let n: Int = input[1]
var lanCable: [Int] = []
for _ in 0..<k {
    lanCable.append(Int(readLine()!)!)
}
lanCable.sort()

var start: Int = 1
var end: Int = lanCable[k - 1]

var result: Int = 0
while start <= end {
    let mid: Int = (start + end) / 2
    
    var count: Int = 0
    for i in lanCable {
        count += (i / mid)
    }
    
    if n <= count {
        start = mid + 1
        result = start
    } else {
        end = mid - 1
    }
}
print(result - 1)
