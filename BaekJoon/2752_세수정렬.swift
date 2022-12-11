import Foundation

print(readLine()!.split(separator: " ").map { Int(String($0))! }
                .sorted().map { String($0) }.joined(separator: " "))
