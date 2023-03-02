import Foundation

var chessBoard: [[Character]] = []
// 체스판의 정보 입력 받기
for _ in 0..<8 {
    chessBoard.append(Array(readLine()!))
}
// 하얀 칸 위에 존재하는 말의 수를 저장하는 변수
var count = 0
// 하얀 칸 위에 존재하는 말의 수 카운팅하기
for i in 0..<8 {
    for j in 0..<8 {
        if chessBoard[i][j] == "F" {
            if (i % 2 == 0) && (j % 2 == 0) {
                count += 1
            } else if (i % 2 == 1) && (j % 2 == 1) {
                count += 1
            }
        }
    }
}
print(count) // 결과값 출력하기
