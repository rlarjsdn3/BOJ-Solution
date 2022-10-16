import Foundation

var nk: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var data: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

data.sort(by: >)
print(data[nk[1]-1])
