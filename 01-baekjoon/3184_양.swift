import Foundation

// 마당의 행 R과 열 C 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r, c) = (input[0], input[1])
// 마당의 구조 정보 입력 받기
var yard: [[Character]] = []
for _ in 0..<r {
    yard.append(Array(readLine()!))
}
// 살아남은 양과 늑대의 수를 저장
var sheep = 0, wolf = 0

// 노드 구조체 정의
struct Node {
    var x, y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

// 큐(Queue) 자료구조
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

// bfs 정의
func bfs(_ yard: [[Character]], _ x: Int, _ y: Int, _ visited: inout [[Bool]]) -> (sheep: Int, wolf: Int) {
    // 이미 한번 방문한 적이 있는 경우
    if visited[x][y] {
        return (0, 0)
    }
    
    // 양과 늑대의 총 마리 수 저장
    var sheep = 0
    var wolf = 0
    
    // 네 가지 방향(상, 하, 좌, 우) 설정
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    // 큐 자료구조 선언
    var queue = Queue<Node>()
    queue.enqueue(Node(x, y))
    visited[x][y] = true
    
    // 큐가 빌 때까지 반복
    while !queue.isEmpty {
        let node = queue.dequeue()!
        switch yard[node.x][node.y] {
        case "o": sheep += 1 // 새로운 위치에 양(o)이 존재하는 경우
        case "v": wolf += 1  // 새로운 위치에 늑대(v)가 존재하는 경우
        case "#": continue // 새로운 위치에 울타리(#)가 존재하는 경우
        default: break
        }
        
        for i in 0..<4 {
            let nx = dx[i] + node.x
            let ny = dy[i] + node.y
            
            // 새로운 위치가 마당의 범위를 벗어나는 경우
            if nx < 0 || nx >= r || ny < 0 || ny >= c {
                continue
            }
            
            // 새로운 위치에 아직 방문하지 않은 경우
            if !visited[nx][ny] {
                queue.enqueue(Node(nx, ny))
                visited[nx][ny] = true
            }
        }
    }
    
    return (sheep, wolf)
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)

for i in 0..<r {
    for j in 0..<c {
        // 하나의 울타리 구역에서 양과 늑대의 수 구하기
        let result = bfs(yard, i, j, &visited)
        // 양의 수보다 늑대의 수가 같거나 더 많은 경우
        if result.sheep <= result.wolf {
            wolf += result.wolf
        // 양의 수가 늑대의 수보다 더 많은 경우
        } else {
            sheep += result.sheep
        }
    }
}
print(sheep, wolf) // 결과값 출력하기
