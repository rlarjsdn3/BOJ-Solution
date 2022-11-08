import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var set: Set<Int> = []
    for i in 0..<numbers.count {
        for j in 0..<numbers.count {
            if i != j {
                set.insert(numbers[i] + numbers[j])
            }
        }
    }
    
    return [Int](set).sorted()
}

print(solution([2, 1, 3, 4, 1]))
