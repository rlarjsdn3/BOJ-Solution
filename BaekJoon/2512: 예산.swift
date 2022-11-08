import Foundation

let n: Int = Int(readLine()!)!
var budget: [Int] = readLine()!.split(separator: " ")
                        .map { Int(String($0))! }.sorted()
let m: Int = Int(readLine()!)!

var start: Int = 0
var end: Int = budget[budget.count-1]

var result: Int = 0
while start <= end {
    let mid: Int = (start+end) / 2
    
    var sum: Int = 0
    for m in budget {
        if m <= mid {
            sum += m
        } else {
            sum += mid
        }
    }
    
    if m >= sum {
        start = mid + 1
        result = start
    } else {
        end = mid - 1
    }
}

print(result - 1)
