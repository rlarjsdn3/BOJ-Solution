import Foundation

let n: Int = Int(readLine()!)!

for i in stride(from: n, to: 0, by: -1) {
    for _ in stride(from: 0, to: i, by: 1) {
        print("*",terminator: "")
    }
    print()
}
