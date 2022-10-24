import Foundation

var student: [Int] = [Int](repeating: 0, count: 31)
var no: Int = 0

for _ in 0..<28 {
    let n: Int = Int(readLine()!)!
    student[n] = 1
}

student.forEach {
    if $0 == 0 && no != 0 {
        print(no)
    }
    
    no += 1;
}
