import Foundation

// 총 책의 가격 N 입력 받기
let n = Int(readLine()!)!
// 니머지 책의 가격 입력 받기 위한 배열 선언
var books = [Int]()
// 나머지 9권의 가격 입력 받기
for _ in 0..<9 {
    books.append(Int(readLine()!)!)
}
// 결과값 출력하기
print(n - books.reduce(0, +))
