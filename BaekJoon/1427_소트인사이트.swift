import Foundation

var input: String = Array(readLine()!)
                    .sorted(by: >)
                    .reduce("") { $0 + String($1) }
print(input)
