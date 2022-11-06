import Foundation

let n: Int = Int(readLine()!)!

let average: Int
let meidan: Int
let range: Int
var mode: [(key: Int, value: Int)]

var array: [Int] = []
var dict: [Int: Int] = [:]
for _ in 0..<n {
    let tmp: Int = Int(readLine()!)!
    array.append(tmp)
    if dict.keys.contains(tmp) {
        dict[tmp]! += 1
    } else {
        dict[tmp] = 1
    }
    
}
array.sort()

average = Int(round(Double(array.reduce(0) { return $0 + $1 }) / Double(array.count)))
meidan = array[array.count / 2]
range = array.max()! - array.min()!
mode = dict.sorted {
    if $0.value == $1.value {
        return $0.key < $1.key
    }
    
    return $0.value > $1.value
}

print(average)
print(meidan)
print((mode.count==1) || (mode[0].value != mode[1].value) ? mode[0].key : mode[1].key)
print(range)
