import Foundation

@discardableResult
func dfs(_ graph: inout [[Int]], x: Int, y: Int) -> Bool {
    if x < 0 || x >= graph.count || y < 0 || y >= graph[0].count {
        return false
    }
    
    // 해당 배추에 아직 방문하지 않은 경우
    if graph[x][y] == 1 {
        // 해당 배추 방문 여부 표시
        graph[x][y] = 0
        
        // 주변에 배추가 존재하는지 확인
        dfs(&graph, x: x + 1, y: y)
        dfs(&graph, x: x - 1, y: y)
        dfs(&graph, x: x, y: y + 1)
        dfs(&graph, x: x, y: y - 1)
        return true
    }
    
    return false
}

let n: Int = Int(readLine()!)!

var result: [Int] = []
for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n: Int = input[0] // 배추밭의 세로 길이
    let m: Int = input[1] // 배추밭의 가로 길이
    let k: Int = input[2] // 배추의 위치한 개수
    
    // 배추밭을 표현한 2차원 배열에 배추 위치 입력 받기
    var cabbageField: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    for _ in 0..<k {
        let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
        cabbageField[input[0]][input[1]] = 1
    }
    
    // 배추흰지렁이가 필요한지 얼마나 필요한지 계산
    var count: Int = 0
    for i in 0..<n {
        for j in 0..<m {
            if dfs(&cabbageField, x: i, y: j) {
                count += 1
            }
        }
    }
    result.append(count)
}
result.forEach { print($0) }
