import Foundation

let n: Int = Int(readLine()!)!

var user1: Int = 100
var user2: Int = 100
for _ in 0..<n {
    let game: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
    if game[0] < game[1] {
        user1 -= game[1]
    } else if game[0] > game[1] {
        user2 -= game[0]
    } else {
        continue
    }
}

print(user1)
print(user2)
