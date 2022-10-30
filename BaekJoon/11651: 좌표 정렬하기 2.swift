import Foundation

let n: Int = Int(readLine()!)!
var point: [(x: Int, y: Int)] = []
for _ in 0..<n {
    let input: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
    point.append((input[0], input[1]))
}

point.sort { (p1, p2) in
    if p1.y != p2.y {
        return p1.y < p2.y
    } else {
        return p1.x < p2.x
    }
}

point.forEach {
    print("\($0.x) \($0.y)")
}
