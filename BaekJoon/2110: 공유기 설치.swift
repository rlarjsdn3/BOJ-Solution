import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let c: Int = input[1]
var iptime: [Int] = []
for _ in 0..<n {
    iptime.append(Int(readLine()!)!)
}
iptime.sort()

var start: Int = 1
var end: Int = iptime.last! - iptime.first!

var result: Int = 0
while start <= end {
    let mid = (start+end) / 2
    
    var count: Int = 1
    var value: Int = iptime.first!
    for i in iptime {
        if mid <= i - value {
            count += 1
            value = i
        }
    }
    
    if c <= count {
        start = mid + 1
        result = start
    } else {
        end = mid - 1
    }
}

print(result - 1)
