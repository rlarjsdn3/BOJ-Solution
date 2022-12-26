import Foundation

let n: Int = Int(readLine()!)!
let f: Int = Int(readLine()!)!

var digit: Int = n % 100 // 백의 자리까지 정수 구하기
var cut: Int = -digit
while (n+cut) % f != 0 {
    cut += 1
}

let result: Int = digit + cut
result < 10 ? print("0\(result)") : print(result) // 결과 출력
