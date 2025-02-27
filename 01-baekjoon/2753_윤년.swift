import Foundation

// 연도 입력받기
let y = Int(readLine()!)!

// 윤년인지 판별하기
if (y % 4 == 0) && (y % 100 != 0) || (y % 400 == 0) {
    print(1)
} else {
    print(0)
}
