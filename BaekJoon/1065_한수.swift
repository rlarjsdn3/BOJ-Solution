import Foundation

var count: Int = 0
let input: Int = Int(readLine()!)!

for n in 1...input {
    if n >= 100 {
        let num: String = String(n)
        let gap: Int = Int(String(num[num.startIndex]))!
                            - Int(String(num[num.index(num.startIndex, offsetBy: 1)]))!
        var isHansu: Bool = true
        for j in 2..<num.count {
            let newGap = Int(String(num[num.index(num.startIndex, offsetBy: j-1)]))!
                            - Int(String(num[num.index(num.startIndex, offsetBy: j)]))!
            if gap != newGap {
                isHansu = false
                break
            }
        }
        
        if isHansu {
            count += 1
        }
    } else {
        count += 1
    }
}
print(count)
