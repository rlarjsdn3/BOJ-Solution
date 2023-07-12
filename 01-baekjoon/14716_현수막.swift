import Foundation

@discardableResult
func dfs(_ x: Int, _ y: Int) -> Bool {
    // 새로운 좌표가 범위를 벗어나는 경우
    if x < 0 || y < 0 || x >= m || y >= n {
        return false
    }
    
    // 새로운 좌표에 이미 방문한 경우
    if banner[x][y] == 0 {
        return false
    }
    
    // 새로운 좌표에 아직 방문하지 않은 경우
    if banner[x][y] != 0 {
        // 해당 좌표에 방문했다는 의미로
        banner[x][y] = 0 // 0 대입
        
        // 갈 수 있는 모든 방향으로 이동
        dfs(x - 1, y)
        dfs(x + 1, y)
        dfs(x, y - 1)
        dfs(x, y + 1)
        dfs(x - 1, y - 1)
        dfs(x + 1, y - 1)
        dfs(x - 1, y + 1)
        dfs(x + 1, y + 1)
        return true
    }
    
    return false
}

// 현수막의 세로 크기 M과 가로 크기 N 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m, n) = (input[0], input[1])
// 현수막의 정보 입력 받기
var banner = [[Int]]()
for _ in 0..<m {
    banner.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
// 글자 수를 저장할 변수 선언
var result = 0

// 깊이 우선 탐색(DFS) 알고리즘 수행
for x in 0..<m {
    for y in 0..<n {
        if dfs(x, y) {
            result += 1
        }
    }
}
// 결과값 출력하기
print(result)
