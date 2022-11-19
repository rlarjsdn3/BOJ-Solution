import Foundation

let input: String = readLine()!
let parsing : [String] = input.components(separatedBy: "-")

var result: Int = 0
for i in 0..<parsing.count {
    let tmp: Int = parsing[i].components(separatedBy: "+")
                                .map { Int($0)! }.reduce(0, +)
    if i == 0 { result += tmp }
    else { result -= tmp }
}
print(result)
