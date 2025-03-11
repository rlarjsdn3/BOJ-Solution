import Foundation

// 음계 K 입력 받기
let k = readLine()!
// 결과 답안 출력
if k == "1 2 3 4 5 6 7 8" {
    print("ascending")
} else if k == "8 7 6 5 4 3 2 1" {
    print("descending")
} else {
    print("mixed")
}
