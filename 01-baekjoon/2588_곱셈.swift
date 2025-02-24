import Foundation

let a = Int(readLine()!)!
var b = Int(readLine()!)!

var p = b
var n = 10
while n <= 1000 {
    let x = p % n / (n / 10)
    print(x * a)
    n *= 10
}
print(a * b)
