import Foundation

let n: Int = Int(readLine()!)!
var rope: [Int] = []
for _ in 0..<n {
    rope.append(Int(readLine()!)!)
}
rope.sort(by: >)

var max: Int = rope[0]
for i in 1..<rope.count {
    let tmp: Int = rope[i] * (i+1)
    if max < tmp {
        max = tmp
    } 
}
print(max)
