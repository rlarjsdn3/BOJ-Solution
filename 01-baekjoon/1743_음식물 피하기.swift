// 세로 길이 N, 가로 길이 M과 음식물의 개수 K 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k) = (input[0], input[1], input[2])
// 음식물이 떨어진 좌표 정보 입력 받기
var path = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    path[input[0]][input[1]] = 1 // 음식물이 떨어진 위치에 1 대입
}

func dfs(_ x: Int, _ y: Int) -> Int {
    // 해당 위치가 복도의 범위를 벗어나는 경우
    if x <= 0 || x > n || y <= 0 || y > m {
        return 0
    }
    
    // 해당 위치에 아직 방문하지 않은 경우
    if path[x][y] == 1 {
        // 해당 위치 방문 표시
        path[x][y] = 0
        // 상, 하, 좌, 우 방향으로 이동하며 음식물 개수 세기
        return dfs(x + 1, y) + dfs(x - 1, y) +
                    dfs(x, y + 1) + dfs(x, y - 1) + 1
    } else {
        return 0
    }
}

// 깊이 우선 탐색(DFS) 알고리즘 수행
var result = 0
for i in 1...n {
    for j in 1...m {
        result = max(dfs(i, j), result)
    }
}
print(result) // 결과값 출력하기
