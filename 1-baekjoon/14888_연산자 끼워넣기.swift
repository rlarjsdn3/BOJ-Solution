import Foundation

// 정수 N 입력 받기
let n: Int = Int(readLine()!)!
// 수열 입력 받기
var num: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
// 연산자(+, -, *, /)의 개수 입력 받기
let opr: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
var (add, sub, mul, div): (Int, Int, Int, Int) = (opr[0], opr[1], opr[2], opr[3])


// 깊이 우선 탐색으로 모든 연산자 끼워 넣기
var minValue: Int = +1_000_000_000
var maxValue: Int = -1_000_000_000

func dfs(_ i: Int, _ now: Int) {
    // 모든 연산자를 사용한 경우, 최솟값과 최댓값 업데이트하기
    if i == n {
        minValue = min(minValue, now)
        maxValue = max(maxValue, now)
    } else {
        // 각 연산자에 대하여 재귀적으로 수행
        if add > 0 {
            add -= 1
            dfs(i + 1, now + num[i])
            add += 1
        }
        
        if sub > 0 {
            sub -= 1
            dfs(i + 1, now - num[i])
            sub += 1
        }
        
        if mul > 0 {
            mul -= 1
            dfs(i + 1, now * num[i])
            mul += 1
        }
        
        if div > 0 {
            div -= 1
            dfs(i + 1, now / num[i])
            div += 1
        }
    }
}

// 깊이 우선 탐색 함수 호출
dfs(1, num[0])

// 최솟값, 최댓값 출략하기
print(maxValue)
print(minValue)
