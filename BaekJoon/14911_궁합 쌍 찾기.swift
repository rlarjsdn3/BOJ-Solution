import Foundation

struct Point: Hashable {
    var x: Int
    var y: Int
}

let n: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let t: Int = Int(readLine()!)!

var pair: Set<Point> = []
for i in 0..<n.count {
    for j in (i+1)..<n.count {
        if n[i]+n[j] == t {
            pair.insert(Point(x: n[i], y: n[j]))
        }
    }
}
let result: [Point] = pair.sorted {
    if $0.x == $1.x {
        return $0.y < $1.y
    }
    
    return $0.x < $1.x
}

result.forEach {
    print("\($0.x) \($0.y)")
}
print(result.count)
