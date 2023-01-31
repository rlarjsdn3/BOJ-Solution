import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let sumOfTiles: Int = brown + yellow
    
    for x in 3...sumOfTiles {
        for y in 3...x {
            if (x*y) == sumOfTiles && ((x-2)*(y-2)) == yellow {
                return [Int]([x, y])
            }
        }
    }
    
    return []
}

print(solution(24, 24))
