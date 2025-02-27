import Foundation

// 시험 점수 입력받기
let s = Int(readLine()!)!

// 시험 성적 비교하기
switch s {
case 90...:   print("A")
case 80..<90: print("B")
case 70..<80: print("C")
case 60..<70: print("D")
default:      print("F")
}
