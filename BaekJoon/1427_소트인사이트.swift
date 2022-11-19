import Foundation

var n: String = Array(readLine()!)
                    .sorted(by: >)
                    .reduce("") { $0 + String($1) }

print(n)
