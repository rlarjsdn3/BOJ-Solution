let n: Int = Int(readLine()!)!
var confetti: [(x: Int, y: Int)] = []

var maxX: Int = 0, maxY: Int = 0
for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    confetti.append((input[0], input[1]))
    if maxX < input[0] { maxX = input[0] }
    if maxY < input[1] { maxY = input[1] }
}

var graph: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: maxX+10), count: maxY+10)
for g in confetti {
    for i in g.y..<g.y+10 {
        for j in g.x..<g.x+10 {
            graph[i][j] += 1
        }
    }
}

var result: Int = 0
for i in 0..<graph.count {
    for j in 0..<graph[i].count {
        if graph[i][j] > 0 {
            result += 1
        }
    }
}
print(result)
