import Foundation

// 방의 세로 크기 N과 가로 크기 M 입력 받기
var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])
// 로봇 청소기의 위치 좌표 R, C와 바라보는 방향 D 입력 받기
input = readLine()!.split(separator: " ").map { Int(String($0))! }
var (r, c, d) = (input[0], input[1], input[2])
// 장소의 상태 입력 받기
var room: [[Int]] = []
for _ in 0..<n {
    room.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

// 방문 여부를 확인하는 변수
var visited: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
visited[r][c] = 1 // 최초 위치 방문 표시

// 4가지 방향 설정(북, 동, 남, 서)
let dr = [-1, +0, +1, +0]
let dc = [+0, +1, +0, -1]

// 반시계 방향으로 90도 회전하는 함수
func turnLeft() {
    d -= 1
    if d == -1 {
        d = 3
    }
}

// 로봇 청소기 작동시키기
var result = 1
var turnCount = 0
while true {
    // 반시계 방향으로 회전
    turnLeft()
    // 바라보는 방향으로 한 칸 앞으로 전진
    let nr = r + dr[d]
    let nc = c + dc[d]
    
    // 해당 위치에 아직 방문하지 않았고 벽이 아닌 경우
    if room[nr][nc] == 0 && visited[nr][nc] == 0 {
        visited[nr][nc] = 1
        r = nr
        c = nc
        result += 1
        turnCount = 0
        continue
    } else {
        turnCount += 1
    }
    
    // 현재 위치에서 4번 회전한 경우
    if turnCount == 4 {
        // 바라보는 방향에서 한 칸 뒤로 후진
        let nr = r - dr[d]
        let nc = c - dc[d]
        // 뒤쪽 칸이 벽인 아닌 경우
        if room[nr][nc] != 1 {
            r = nr
            c = nc
        // 뒤쪽 칸이 벽인 경우
        } else {
            break
        }
        
        turnCount = 0
    }
}
print(result) // 결과값 출력하기
