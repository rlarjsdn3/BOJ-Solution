import Foundation

let INF = 10_000_000_000 // 무한(INFINITY)

func dijkstra(_ n: Int, _ cave: [[Int]]) -> Int {
    //
    func getSamllestNode() -> (x: Int, y: Int, distance: Int) {
        var minValue = INF
        var x = 0, y = 0
        for i in 0..<n {
            for j in 0..<n {
                if minValue > distance[i][j] && !visited[i][j] {
                    minValue = distance[i][j]
                    x = i
                    y = j
                }
            }
        }
        return (x, y, minValue)
    }
    
    // 방향(상, 하, 좌, 우) 정보
    let dx = [0, 0, 1, -1]
    let dy = [-1, 1, 0, 0]
    
    // 노드 방문 여부를 확인하는 변수
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    // 최단 경로를 저장하는 변수
    var distance = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)
    
    // 최초 시작 노드 초기화
    distance[0][0] = cave[0][0]
    distance[1][0] = distance[0][0] + cave[1][0]
    distance[0][1] = distance[0][0] + cave[0][1]
    visited[0][0] = true
    
    for _ in 0..<n {
        for _ in 0..<n {
            let now = getSamllestNode()
            visited[now.x][now.y] = true
            
            for j in 0..<4 {
                let nx = now.x + dx[j]
                let ny = now.y + dy[j]
                // 동굴의 범위를 벗어나는 경우
                if nx < 0 || nx >= n || ny < 0 || ny >= n {
                    continue
                }
                
                let cost = now.distance + cave[nx][ny]
                // 다른 경로보다 지금 경로가 더 빠른 경우
                if cost < distance[nx][ny] {
                    distance[nx][ny] = cost
                }
            }
        }
    }
    
    return distance[n-1][n-1]
}

var result: [Int] = [] // 결과값을 저장할 변수
while true {
    // 동굴의 크기 N 입력 받기
    let n = Int(readLine()!)!
    // 0을 입력 받으면 while문 탈출
    if n == 0 { break }
    // 동굴의 정보 입력 받기
    var cave: [[Int]] = []
    for _ in 0..<n {
        cave.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    // 다익스트라 최단 경로 알고리즘 수행
    result.append(dijkstra(n, cave))
}
// 결과값 출력하기
for i in 0..<result.count {
    print("Problem \(i+1): \(result[i])")
}
