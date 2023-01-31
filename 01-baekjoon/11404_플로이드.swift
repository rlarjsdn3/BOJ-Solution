import Foundation

// 도시의 개수 N 입력 받기
let n: Int = Int(readLine()!)!
// 버스의 개수 M 입력 받기
let m: Int = Int(readLine()!)!
// 버스의 정보 M개 입력 받기
let INF: Int = 1_000_000_000 // (10억)
var busInfo: [[Int]] = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)
for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, c): (Int, Int, Int) = (input[0], input[1], input[2])
    
    if busInfo[a-1][b-1] > c {
        busInfo[a-1][b-1] = c
    }
}

// 플로이드-워셜 알고리즘 수행(최단거리 구하기)
for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if i != j {
                busInfo[i][j] = min(busInfo[i][j], busInfo[i][k] + busInfo[k][j])
            }
        }
    }
}

// 결과값 출력
for i in 0..<n {
    for j in 0..<n {
        if busInfo[i][j] != INF {
            print(busInfo[i][j], terminator: " ")
        } else {
            print(0, terminator: " ")
        }
    }
    print()
}

// * 초기값을 10억으로 준 이유는 단방향으로만 경로가 있는 경우 최단 거리가 1억을 넘길 수 있기 때문입니다.
