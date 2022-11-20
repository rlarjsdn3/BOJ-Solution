import Foundation

func solution(_ N: Int, _ stages: [Int]) -> [Int] {
    var fail: [(no: Int, rate: Double)] = []
    var total: Double = Double(stages.count)
    
    // 스테이지 번호를 1부터 N까지 증가시키며
    for i in 1...N {
        // 해당 스테이지에 머물어 있는 사람의 수 계산
        var count: Double = 0.0
        for j in 0..<stages.count {
            if i == stages[j] { count += 1.0 }
        }
        
        // 실패율 계산 후
        // 배열에 (스테이지 번호, 실패율) 요소 삽입
        fail.append((i, count / total))
        total -= count
    }
    
    // 실패율을 기준으로 각 요소를 내림차순 정렬
    fail.sort { $0.rate > $1.rate }
    
    // 정렬된 요소의 번호를 result 배열에 삽입 후 반환
    var result: [Int] = []
    fail.forEach { result.append($0.no) }
    
    return result
}

print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))
