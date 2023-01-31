import Foundation

struct Point {
    var x: Int
    var y: Int
}

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

// 너비 우선 탐색 구현
func checkPicture(_ graph: inout [[Int]], x: Int, y: Int) -> Int? {
    guard graph[x][y] != 0 else {
        return nil
    }
    
    // 이동할 방향(상, 하, 좌, 우) 변수
    let d: [(x: Int, y: Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    
    // 그림의 넓이를 구하는 변수
    var count: Int = 0
    
    var queue: Queue<Point> = Queue<Point>()
    queue.enqueue(Point(x: x, y: y))
    
    while !queue.isEmpty {
        let p: Point = queue.dequeue()!
        // 해당 노드에 아직 방문하지 않았다면
        if graph[p.x][p.y] == 1 {
            // 해당 노드 방문 표시하고
            graph[p.x][p.y] = 0
            count += 1 // 카운팅하기
        }
        
        // 인접 노드에 방문 가능한지 확인
        for i in 0..<4 {
            let n: (x: Int, y: Int) = (p.x + d[i].x, p.y + d[i].y)
            
            // 해당 노드가 그림 범위를 넘어서는 경우
            if n.x < 0 || n.x >= graph.count || n.y < 0 || n.y >= graph[0].count {
                continue
            }
            
            // 해당 노드에 이미 방문한 경우
            if graph[n.x][n.y] == 0 {
                continue
            }
            
            // 해당 노드에 방문하지 않은 경우
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

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m): (Int, Int) = (input[0], input[1])

var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var result: [Int] = []
for i in 0..<n {
    for j in 0..<m {
        if let count: Int = checkPicture(&graph, x: i, y: j) {
            result.append(count)
        }
    }
}
print(result.count)
print(result.count != 0 ? result.max()! : 0)
