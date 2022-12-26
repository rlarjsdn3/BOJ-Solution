import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    return (left...right).map { max(Int($0)/n+1, Int($0)%n+1) }
}

print(solution(3, 2, 5))
