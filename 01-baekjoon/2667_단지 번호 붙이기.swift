import Foundation

// 좌표값을 저장할 구조체
struct Point {
    var x: Int
    var y: Int
}

// 너비 우선 탐색 구현을 도와줄 큐
public struct Queue<T> {
    fileprivate var array: [T?] = []
    fileprivate var head: Int = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    @discardableResult public mutating func dequeue() -> T? {
        guard let element = array[guarded: head] else {
            return nil
        }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    var front: T? {
        guard !isEmpty else {
            return nil
        }
        
        return array[head]
    }
}

extension Array {
    subscript(guarded index: Int) -> Element? {
        guard (startIndex..<endIndex).contains(index) else {
            return nil
        }
        
        return self[index]
    }
}

// 너비 우선 탐색
@discardableResult func numberComplex(_ graph: inout [[Int]], x: Int, y: Int) -> Int {
    // 시작점이 집이 아닌 경우
    guard graph[x][y] != 0 else { return 0 }
    
    // 집의 개수를 세아려 주는 변수
    var count: Int = 0
    
    // 이동할 방향(상, 하, 좌, 우)을 나타내는 변수
    let d: [(x: Int, y: Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    
    var queue: Queue<Point> = Queue<Point>()
    queue.enqueue(Point(x: x, y: y))
    
    while !queue.isEmpty {
        let p: Point = queue.dequeue()!
        
        // 현재 좌표에 아직 방문하지 않은 경우
        if graph[p.x][p.y] == 1 {
            // 해당 노드를 방문 처리하고
            graph[p.x][p.y] = 0
            count += 1 // 카운팅하기
        }
        
        // 새 좌표로 차례대로 방문 시도
        for i in 0..<4 {
            let n: (x: Int, y: Int) = (p.x + d[i].x, p.y + d[i].y)
            
            // 새 좌표가 그래프 범위를 넘어가는 경우
            if n.x < 0 || n.x >= graph.count || n.y < 0 || n.y >= graph[0].count {
                continue
            }
            
            // 새 좌표에 이미 방문한 경우
            if graph[n.x][n.y] == 0 {
                continue
            }
            
            // 새 좌표에 아직 방문하지 않은 경우
            if graph[n.x][n.y] == 1 {
                // 해당 노드 방문 표시하고
                graph[n.x][n.y] = 0
                count += 1 // 카운팅하기
                queue.enqueue(Point(x: n.x, y: n.y))
            }
        }
    }
    
    return count
}


let n: Int = Int(readLine()!)!
var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(Array(readLine()!.map { Int(String($0))! }))
}

var result: [Int] = []
for i in 0..<n {
    for j in 0..<n {
        let count: Int = numberComplex(&graph, x: i, y: j)
        if count > 0 {
            result.append(count)
        }
    }
}
result.sort()

// 결과 출력
print(result.count)
result.forEach { print($0) }
