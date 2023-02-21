import Foundation

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


// 학생의 수 N과 비교 횟수 M 입력 받기
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 모든 학생의 비교 정보를 저장한 배열
var students = [[Int]](repeating: [Int](), count: n + 1)
// 모든 학생의 진입 차수를 저장한 배열
var indegree = [Int](repeating: 0, count: n + 1)

// 모든 학생의 비교 정보 입력 받기
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    // input[0] 학생이 input[1] 학생보다 더 앞에 있어야 한다는 의미
    students[input[0]].append(input[1])
    // 후순위 학생 노드의 진입 차수 1 증가
    indegree[input[1]] += 1
}

// 학생의 키 순서를 저장한 배열
var result: [Int] = []

// 위상 정렬(topologySort) 함수
func topologySort() -> [Int] {
    var result: [Int] = [] // 알고리즘 수행 결과를 저장할 배열
    var queue = Queue<Int>() // 큐(Queue) 구조체 선언
    
    // 진입 차수가 0인 노드를 큐에 삽입
    for i in 1...n where indegree[i] == 0 {
        queue.enqueue(i)
    }
    
    // 큐가 빌 때까지 반복
    while !queue.isEmpty {
        let now = queue.dequeue()!
        result.append(now)
        // 해당 노드에 인접한 노드의 진입 차수 1 빼기
        for i in students[now] {
            indegree[i] -= 1
            // 진입 차수가 0인 노드는 큐에 삽입
            if indegree[i] == 0 {
                queue.enqueue(i)
            }
        }
    }
    
    return result
}

// 결과값 출력하기
topologySort().forEach { print($0, terminator: " ") }
