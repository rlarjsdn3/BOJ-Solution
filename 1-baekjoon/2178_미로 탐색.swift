struct Point {
    var x: Int
    var y: Int
}

public struct Queue<T> {
    fileprivate var array: [T] = []
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    @discardableResult public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        
        return array.removeFirst()
    }
    
    public var front: T? {
        return array.first
    }
}

// 미로를 탈출하기 위한 최단 경로를 구해주는 함수
func mazeEscape(_ graph: inout [[Int]], x: Int, y: Int) {
    // 이동할 방향(좌, 우, 상, 하)
    let d: [(x: Int, y: Int)] = [(0, -1), (0, 1), (-1, 0), (1, 0)]
    
    var queue: Queue<Point> = Queue<Point>()
    queue.enqueue(Point(x: x, y: y))
    
    // 큐가 빌 때까지 반복
    while !queue.isEmpty {
        let p: Point = queue.dequeue()!
        
        // 현재 위치에서 네 방향으로의 위치 확인
        for i in 0..<4 {
            // 이동한 새로운 위치 좌표 계산
            let n: (x: Int, y: Int) = (p.x+d[i].x, p.y+d[i].y)
            
            // 새 좌표가 정해진 공간을 벗어나는 경우 무시
            if n.x < 0 || n.x >= graph.count || n.y < 0 || n.y >= graph[0].count {
                continue
            }
            
            // 새 좌표에 이동할 수 없는 경우 무시
            if graph[n.x][n.y] == 0 {
                continue
            }
            
            // 새 좌표에 아직 방문하지 않은 경우에만 최단거리 기록
            if graph[n.x][n.y] == 1 {
                graph[n.x][n.y] = graph[p.x][p.y] + 1
                queue.enqueue(Point(x: n.x, y: n.y))
            }
        }
    }
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(Array(readLine()!.map { Int(String($0))! }))
}

mazeEscape(&graph, x: 0, y: 0) // 시작점(0, 0)에서 출발
print(graph[n - 1][m - 1]) // 도착점(n, m) 좌표까지 최단거리 출력
