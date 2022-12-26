import Foundation

extension String {
    subscript(index i: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: i)..<self.endIndex])
    }
}

let input: String = readLine()!
var suffix: [String] = []
for i in 0..<input.count {
    suffix.append(input[index: i])
}
suffix.sorted().forEach { print($0) }
