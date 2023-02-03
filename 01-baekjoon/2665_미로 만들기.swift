import Foundation

let INF = 10_000_000_000 // 무한(INFINITY)

// 방의 수 N 입력 받기
let n = Int(readLine()!)!
// 방의 정보 입력 받기
var rooms: [[Int]] = []
for _ in 0..<n {
    rooms.append(Array(readLine()!).map { Int(String($0))! })
}

// 방문 여부를 확인하는 변수
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
// 최소 파괴 횟수를 저장하는 변수
var breaks = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)

func dijkstra() {
    // 방의 색깔을 보고 부숴야 하는지 판단
    func checkRoomColor(_ x: Int, _ y: Int) -> Int {
        // 방의 색깔이 검정(0)이라면 부숴야 하므로 부순 횟수(breaks) 1 증가
        rooms[x][y] == 0 ? 1 : 0
    }

    // 가장 적게 방을 부순 노드(위치)를 반환
    func getSmallestNode() -> (x: Int, y: Int, breaks: Int) {
        var minValue = INF
        var x = 0, y = 0
        for i in 0..<n {
            for j in 0..<n where breaks[i][j] < minValue && !visited[i][j] {
                minValue = breaks[i][j]
                x = i
                y = j
            }
        }
        return (x, y, minValue)
    }
    
    // 네 가지 방향(상, 하, 좌, 우) 설정
    let dx = [0, 0, 1, -1]
    let dy = [-1, 1, 0, 0]
    
    // 최초 시작 노드 초기화
    breaks[0][0] = checkRoomColor(0, 0)
    breaks[0][1] = breaks[0][0] + checkRoomColor(0, 1)
    breaks[1][0] = breaks[0][0] + checkRoomColor(1, 0)
    visited[0][0] = true
    
    for _ in 0..<n {
        for _ in 0..<n {
            let now = getSmallestNode()
            visited[now.x][now.y] = true
            
            // 네 가지 방향으로 이동
            for i in 0..<4 {
                let nx = now.x + dx[i]
                let ny = now.y + dy[i]
                
                // 범위를 벗어나는 경우
                if nx < 0 || nx >= n || ny < 0 || ny >= n {
                    continue
                }
                
                let cost = now.breaks + checkRoomColor(nx, ny)
                // 방을 더 적게 부수고 이동할 수 있는 경우
                if cost < breaks[nx][ny] {
                    breaks[nx][ny] = cost
                }
            }
        }
    }
}

// 다익스트라 알고리즘 수행
dijkstra()

// 결과값 출력하기
print(breaks[n-1][n-1])
