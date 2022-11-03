import Foundation

extension String {
    subscript(safe: Int) -> String {
        var index: String.Index
        if safe < self.count {
            index = self.index(self.startIndex, offsetBy: safe)
        } else {
            index = self.index(before: self.endIndex)
        }
        return String(self[index])
    }
    
    subscript(safe: Range<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: safe.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: safe.upperBound<self.count ? safe.upperBound : self.count)
        return String(self[startIndex..<endIndex])
    }
}

let s: String = readLine()!

var i: Int = 0
var count: Int = 0
while i < s.count {
    let c: String = s[i]
    switch(c) {
    case "d" where s[i+1..<i+3] == "z=":
        i += 3
        count += 1
    case "c" where (s[i+1] == "=" || s[i+1] == "-"):
        fallthrough
    case "d" where s[i+1] == "-":
        fallthrough
    case "l" where s[i+1] == "j":
        fallthrough
    case "n" where s[i+1] == "j":
        fallthrough
    case "s" where s[i+1] == "=":
        fallthrough
    case "z" where s[i+1] == "=":
        i += 2
        count += 1
    default:
        i += 1
        count += 1
    }
}

print(count)
