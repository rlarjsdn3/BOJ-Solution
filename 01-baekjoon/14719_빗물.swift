import Foundation

// 2차원 세계의 세로 길이 H와 가로 길이 W 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (h, w) = (input[0], input[1])

// 블록이 쌓인 높이 정보 입력 받기
let blocks = readLine()!.split(separator: " ").map {Int($0)! }

// 맨 앞과 맨 뒤 칸은 물이 고일 수 없으므로
var result = 0
for i in 1..<w-1 {
    
    // 기준점에서 왼쪽을 바라볼 때 가장 큰 값 찾기
    let leftMax = blocks[0...i-1].max()!
    // 기준점에서 오른쪽을 바라볼 때 가장 큰 값 찾기
    let rightMax = blocks[i+1...w-1].max()!
    // 물이 고일 수 있는 가장 높은 칸 찾기
    let height = min(leftMax, rightMax)
    
    // 찾은 큰 값을 기준으로 담긴 물의 양 계산하기
    if height > blocks[i] {
        result += height - blocks[i]
    }
}
print(result) // 답안 결과 출력
