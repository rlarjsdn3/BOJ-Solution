import Foundation

typealias Graph = [[Int]]

while true {
    
    // 지도의 너비 W와 높이 H 입력 받기
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (w, h ) = (input[0], input[1])
    // 0을 입력받으면 프로그램 종료
    if w == 0 || h == 0 { break }
    
    // 지도 정보 입력 받기
    var array = Graph(repeating: [], count: h)
    for i in 0..<h {
        array[i] = readLine()!.split(separator: " ").map { Int($0)! }
    }
    
    // 깊이 우선 탐색(DFS) 정의
    @discardableResult func dfs(_ graph: inout Graph, _ x: Int, _ y: Int) -> Bool {
        // 좌표가 지도를 벗어난다면
        if x < 0 || y < 0 || x >= h || y >= w {
            return false
        }
        
        // 이미 방문한 노드가 아니라면
        if graph[x][y] != 0 {
            // 해당 위치 방문 처리
            graph[x][y] = 0
            
            // 여덟 방향(상, 하, 좌, 우, 대각선)에 대해 탐색 시작
            let dx = [-1, 1, 0, 0, 1, 1, -1, -1]
            let dy = [0, 0, 1, -1, 1, -1, 1, -1]
            
            for i in 0..<8 {
                dfs(&graph, x + dx[i], y + dy[i])
            }
            return true
        }
        return false
    }
    
    // 모든 위치에서 탐색을 수행하기
    var result = 0
    for x in 0..<h {
        for y in 0..<w {
            // 해당 위치에 섬이 있다면
            if dfs(&array, x, y) {
                result += 1
            }
        }
    }
    // 결과 답안 출력
    print(result)
}
