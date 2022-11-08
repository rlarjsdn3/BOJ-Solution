import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var last: Character = words[0].first!
    var isReated: Set<String> = []
    var user: Int = 0, round: Int = 0
    
    for (seq, str) in words.enumerated() {
        if str.first! != last || isReated.contains(str) {
            user = seq % n + 1
            round = seq / n + 1
            break
        }
            
        last = str.last!
        isReated.insert(str)
    }
    
    return [Int]([user, round])
}

print(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"]))
