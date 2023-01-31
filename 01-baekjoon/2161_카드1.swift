import Foundation

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

var n: Int = Int(readLine()!)!

// 카드 초기화
var cards: Queue<Int> = Queue<Int>()
for i in 1...n { cards.enqueue(i) }

// 카드 뽑기
var result: [Int] = []
while !cards.isEmpty {
    result.append(cards.dequeue()!) // 맨 앞 장의 카드 버리기
    
    // 큐에 카드가 남아있는 경우
    if !cards.isEmpty {
        cards.enqueue(cards.dequeue()!) // 맨 앞 장의 카드를 맨 뒤로 보내기
    }
}
print(result.map { String($0) }.joined(separator: " ")) // 결과 출력
