import Foundation

// X 입력 받기
let x = Int(readLine()!)!
// Y 입력 받기
let y = Int(readLine()!)!

// 어느 사분면에 속하는지 구하기
switch (x, y) {
case (x, y) where x > 0 && y > 0: print("1")
case (x, y) where x < 0 && y > 0: print("2")
case (x, y) where x < 0 && y < 0: print("3")
default:                          print("4")
}
