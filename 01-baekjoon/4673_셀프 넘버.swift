import Foundation

extension String {
    subscript(index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

var generator: [Int] = []
for i in 1...10_000 {
    var tmp: Int {
        var sum: Int = i
        let str: String = String(i)
        for j in 0..<str.count {
            sum += Int(str[j])!
        }
        
        return sum
    }
    generator.append(tmp)
}

for i in 1..<generator.count {
    if !generator.contains(i) {
        print(i)
    }
}
