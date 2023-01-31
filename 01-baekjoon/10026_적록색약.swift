import Foundation

// 그림의 크기 N 입력 받기
let n: Int = Int(readLine()!)!

// 그림의 정보 입력 받기
var paint: [[String]] = []
for _ in 0..<n {
    paint.append(Array(readLine()!).map { String($0) })
}

// 네 가지 방향을 저장한 변수(상, 하, 좌, 우)
let dx: [Int] = [-1, 1, 0, 0]
let dy: [Int] = [0, 0, 1, -1]

// 그림 구획 나누기
@discardableResult
func dfs(_ paint: inout [[String]], x: Int, y: Int, color: String) -> Bool {
    // 이미 방문한 노드인 경우
    if paint[x][y] == "-1" {
        return false // false 리턴
    }
    
    paint[x][y] = "-1"
    
    // 네 가지 방향으로 이동하며 색상 체크하기
    for i in 0..<4 {
        let nx: Int = x + dx[i]
        let ny: Int = y + dy[i]
        
        // 그림의 범위를 넘어서는 경우
        if nx < 0 || nx >= paint.count || ny < 0 || ny >= paint[0].count {
            continue
        }
        
        // 해당 좌표의 색상이 다른 경우
        if paint[nx][ny] != color {
            continue
        }
        
        // 해당 좌표에 아직 방문하지 않은 경우
        if paint[nx][ny] != "-1" {
            dfs(&paint, x: nx, y: ny, color: color)
        }
    }
    
    return true
}

// 좌표를 순회하며 구획 카운팅하기(비장애인)
var result: [Int] = [] // 결과값을 저장한 변수
var tmp: [[String]] = paint // 임시로 그림 정보를 저장한 변수
var count: Int = 0 // 구획의 수를 저장하는 변수

for i in 0..<n {
    for j in 0..<n {
        if dfs(&tmp, x: i, y: j, color: tmp[i][j]) {
            count += 1
        }
    }
}
result.append(count)

// 'G'를 'R'로 색상 바꾸기
for i in 0..<n {
    for j in 0..<n {
        if paint[i][j] == "G" {
            paint[i][j] = "R"
        }
    }
}

// 좌표를 순회하며 구획 카운팅하기(장애인)
tmp = paint
count = 0

for i in 0..<n {
    for j in 0..<n {
        if dfs(&tmp, x: i, y: j, color: tmp[i][j]) {
            count += 1
        }
    }
}
result.append(count)

// 결과값 출력하기
result.forEach { print($0, terminator: " ") }
