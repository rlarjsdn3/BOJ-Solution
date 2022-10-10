import Foundation

var input: Int = Int(readLine()!)!
var fibo: [Int] = [0, 1]

if(input != 1) {
    for i in 2...input {
        fibo.append(fibo[i-1]+fibo[i-2])
    }
}

print(fibo[input])
