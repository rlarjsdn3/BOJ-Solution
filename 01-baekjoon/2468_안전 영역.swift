import Foundation

// 그래프 위치 정보를 저장할 구조체
public struct Point {
    var x: Int
    var y: Int
}

// 큐 구조체
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

let n: Int = Int(readLine()!)! // 지도의 가로와 세로 길이 입력 받기

// 지도 정보 입력받기
var graph: [[Int]] = []
for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var temp: [[Int]] = [] // 임시 지도 정보를 저장하는 변수

var result: Int = 0 // 안전 영역의 개수를 저장하는 변수

// 너비 우선 탐색(BFS)으로 안전 영역인지 반환
func bfs(_ graph: inout [[Int]], x: Int, y: Int) -> Bool {
    // 해당 위치가 물에 잠겨 있는 경우
    if graph[x][y] == 0 {
        return false
    }
    
    // 이동할 방향을 저장한 변수(상, 하, 좌, 우)
    let nx: [Int] = [-1, 1, 0, 0]
    let ny: [Int] = [0, 0, 1, -1]
    
    var queue: Queue<Point> = Queue<Point>()
    queue.enqueue(Point(x: x, y: y))
    
    while !queue.isEmpty {
        let point: Point = queue.dequeue()!
        
        // 상, 하, 좌, 우로 위치 이동
        for i in 0..<4 {
            let dx: Int = point.x + nx[i]
            let dy: Int = point.y + ny[i]
            
            // 해당 위치가 그래프 범위를 넘어서는 경우
            if dx < 0 || dx >= n || dy < 0 || dy >= n {
                continue
            }
            
            // 해당 위치에 이미 방문한 경우
            if graph[dx][dy] == 0 {
                continue
            }
            
            queue.enqueue(Point(x: dx, y: dy))
            graph[dx][dy] = 0 // 해당 위치 방문 표시
        }
    }
    
    return true
}

// 일부 지역을 물에 잠기게 만드는 함수 (물에 잠긴 지역은 0으로 표시)
func rainDrop(_ graph: inout [[Int]], rain: Int) {
    for i in 0..<n {
        for j in 0..<n {
            // 해당 위치가 비의 양보다 높이가 같거나 낮은 경우
            if graph[i][j] <= rain {
                graph[i][j] = 0 // 잠기게 만듦 (0 대입)
            }
        }
    }
}

// 너비 우선 탐색(BFS)으로 안전 영역의 개수 구하기
for i in 0...100 {
    var temp: [[Int]] = graph
    
    rainDrop(&temp, rain: i) // 일부 지역 물에 잠기게 만듦
    
    // 너비 우선 탐색(BFS) 호출
    var count: Int = 0
    for i in 0..<n {
        for j in 0..<n {
            // 안전 영역이 있는 경우
            if bfs(&temp, x: i, y: j) {
                count += 1 // 카운팅 증가
            }
        }
    }
    
    result = max(result, count) // 최대값 저장
}
print(result) // 결과 출력
