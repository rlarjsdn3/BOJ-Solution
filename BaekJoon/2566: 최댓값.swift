import Foundation

var max: Int = Int.min
var xy: (x: Int, y: Int) = (0, 0)

var matrix: [[Int]] = []
for _ in stride(from: 0, to: 9, by: 1) {
    matrix.append(readLine()!.components(separatedBy: " ").map { Int(String($0))! })
}

for i in stride(from: 0, to: 9, by: 1) {
    for j in stride(from: 0, to: 9, by: 1) {
        if max < matrix[i][j] {
            max = matrix[i][j]
            xy.x = i+1
            xy.y = j+1
        }
    }
}

print(max)
print("\(xy.x) \(xy.y)")
