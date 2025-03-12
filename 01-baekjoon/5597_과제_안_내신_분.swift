import Foundation

// 학생의 출석번호 N 입력 받기
var students = [Bool](repeating: false, count: 31)
for _ in 0..<28 {
    students[Int(readLine()!)!] = true
}
// 답안 결과 출력
for i in 1...30 {
    if !students[i] {
        print(i)
    }
}
