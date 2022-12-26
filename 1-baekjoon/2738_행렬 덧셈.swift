import Foundation

var input: [Int]
input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let N: Int = input[0]
let M: Int = input[1]

var matrix1: [[Int]] = []
for _ in stride(from: 0, to: N, by: 1) {
    matrix1.append(readLine()!.components(separatedBy: " ").map { Int(String($0))! })
}

var matrix2: [[Int]] = []
for _ in stride(from: 0, to: N, by: 1) {
    matrix2.append(readLine()!.components(separatedBy: " ").map { Int(String($0))! })
}

var matrix3: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
for i in stride(from: 0, to: N, by: 1) {
    for j in stride(from: 0, to: M, by: 1) {
        matrix3[i][j]  = matrix1[i][j] + matrix2[i][j]
    }
}

for i in matrix3.indices {
    matrix3[i].forEach {
        print($0, terminator: " ")
    }
    print()
}
