extension String {
    subscript(index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let m: Int = input[1]
var chessBoard: [String] = []
for _ in 0..<n {
    chessBoard.append(readLine()!)
}

var result: Int = 1001
for x in 0..<(n-7) {
    for y in 0..<(m-7) {
        var wCount: Int = 0 // W로 바뀌는 횟수
        var bCount: Int = 0 // B로 바뀌는 횟수
        
        for i in 0..<8 {
            for j in 0..<8 {
                if (i+j)%2 == 0 {
                    // 시작점의 색깔과 같아야 하는 경우 (시작점이 'W'라 가정)
                    if chessBoard[x+i][y+j] == "W" {
                        bCount += 1
                    } else {
                        wCount += 1
                    }
                } else {
                    // 시작점의 색깔과 달라야 하는 경우 (시작점이 'W'라 가정)
                    if chessBoard[x+i][y+j] == "B" {
                        bCount += 1
                    } else {
                        wCount += 1
                    }
                }
            }
        }

        result = min(result, min(bCount, wCount))
    }
}

print(result)
