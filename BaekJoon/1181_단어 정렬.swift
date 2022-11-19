import Foundation

let n: Int = Int(readLine()!)!
var wSet: Set<String> = []
var wArray: [String] = []
for _ in 0..<n {
    wSet.insert(readLine()!)
}

wArray = Array(wSet).sorted { (s1, s2) in
    if s1.count != s2.count {
        return s1.count < s2.count
    } else {
        return s1 < s2
    }
}

wArray.forEach {
    print($0)
}
