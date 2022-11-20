import Foundation

let n: Int = Int(readLine()!)!
var human: [(h: Int, w: Int)] = []
for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    human.append((input[0], input[1]))
}

var result: String = ""
for i in human {
    var rank: Int = 1
    
    for j in human {
        if i.h < j.h && i.w < j.w {
            rank += 1
        }
    }
    
    result += String(rank) + " "
}
print(result)
