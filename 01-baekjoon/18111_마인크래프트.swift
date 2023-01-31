import Foundation

// 가로, 세로 길이 N, M과 인벤토리 속 블록의 개수 B 입력 받기
let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, b): (Int, Int, Int) = (input[0], input[1], input[2])
// 땅의 정보 입력받기
var earth: [[Int]] = []
for _ in 0..<n {
    earth.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

// 해당 높이의 블록의 개수를 저장한 변수
var height: [Int] = [Int](repeating: 0, count: 257)
for i in 0..<n {
    for j in 0..<m {
        height[earth[i][j]] += 1
    }
}

// 0-256 높이까지 채우는 모든 경우를 분석해 최소 시간 구하기
var result: (t: Int, h: Int) = (1_000_000_000, 1_000_000_000)
for h in 0...256 {
    var e: [[Int]] = earth
    var v: Int = b
    var t: Int = 0
    
    for x in 0..<n {
        for y in 0..<m {
            let c: Int = abs(e[x][y] - h)
            
            // 해당 칸의 높이가 목표치에 맞는 경우
            if e[x][y] == h {
                continue
            }
            
            // 해당 칸의 높이가 목표치보다 높은 경우
            if e[x][y] > h {
                e[x][y] -= c
                v += c
                t += (c * 2)
            }
            
            // 해당 칸의 높이가 목표치보다 낮은 경우
            if e[x][y] < h {
                e[x][y] += c
                v -= c
                t += c
            }
        }
    }
    
    // 모든 블록을 일정하게 못 채운 경우(인벤토리가 마이너스인 경우)
    if v < 0 {
        break
    }
    
    // 가장 적은 시간이 걸리는 결과값 저장하기
    if result.t == t {
        if result.h < h {
            result = (t, h)
        }
    } else {
        if result.t > t {
            result = (t, h)
        }
    }
}
print("\(result.t) \(result.h)") // 결과값 출력하기
