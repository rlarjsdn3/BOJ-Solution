// JOI시의 높이 H와 너비 W 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (h, w) = (input[0], input[1])
// JOI시의 구름 정보 입력 받기
var joi: [[Character]] = []
for _ in 0..<h {
    joi.append(Array(readLine()!))
}

var result = [[Int]](repeating: [Int](repeating: -1, count: w), count: h)

// 구름 예측하기
for i in 0..<h {
    for j in 0..<w {
        // 해당 위치에 구름이 있는 경우
        if joi[i][j] == "c" {
            result[i][j] = 0
        // 다른 위치에 구름이 있는 경우
        } else {
            // 현재 위치에서 서쪽으로 구름이 얼마나 떨어져 있는지 확인
            for k in stride(from: 1, through: j, by: 1) {
                if joi[i][j-k] == "c" {
                    result[i][j] = k; break
                }
            }
        }
    }
}

// 결과값 출력하기
result.forEach {
    $0.forEach { print($0, terminator: " ") }
    print()
}
