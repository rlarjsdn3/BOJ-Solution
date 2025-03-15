import Foundation

// 테스트 케이스의 수 T 입력 받기
let t = Int(readLine()!)!

// 바라보는 방향에 따라 이동하는 거리 (0: 북, 1: 동, 2: 남, 3: 서)
var dx = [0, 1, 0, -1]
var dy = [1, 0, -1, 0]

// 왼쪽으로 회전
func turnLeft(_ direction: inout Int) {
    direction -= 1
    if direction == -1 {
        direction = 3
    }
}

// 오른쪽으로 회전
func turnRight(_ direction: inout Int) {
    direction += 1
    if direction == 4 {
        direction = 0
    }
}

for _ in 0..<t {
    // 테스트 케이스의 수만큼 이동 경로 입력 받기
    let paths = readLine()!
    
    var direction = 0 // 거북이가 바라보고 있는 방향
    var x = 0, y = 0 // 거북이의 현재 위치
    var minX = 0, maxX = 0 // 거북이가 이동한 최소, 최대 X 거리
    var minY = 0, maxY = 0 // 거북이가 이동한 최소, 최대 Y 거리
    
    // 이동 경로를 하나씩 살펴보며 거북이 이동시키기
    for path in paths {
        switch path {
        case "F":
            x += dx[direction]
            y += dy[direction]
        case "B":
            x -= dx[direction]
            y -= dy[direction]
        case "L":
            turnLeft(&direction)
        default: // "R"
            turnRight(&direction)
        }
        
        minX = min(x, minX)
        maxX = max(x, maxX)
        minY = min(y, minY)
        maxY = max(y, maxY)
    }
    
    let width = abs(minX - maxX)
    let height = abs(minY - maxY)
    print(width * height) // 결과 답안 출력
}


