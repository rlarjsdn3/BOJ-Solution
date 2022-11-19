//
// Created by 김건우 on 2022/11/18.
//

import Foundation

var count: Int = 1
func dfs(_ graph: [[Int]], v: Int, visited: inout [Int]) {
    visited[v] = count
    
    for i in graph[v] {
        if visited[i] == 0 {
            count += 1
            dfs(graph, v: i, visited: &visited)
        }
    }
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let n: Int = input[0]
let m: Int = input[1]
let r: Int = input[2]

var graph: [[Int]] = [[Int]](repeating: [Int](), count: n+1)
for _ in 0..<m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
    let u: Int = input[0]
    let v: Int = input[1]
    graph[u].append(v)
    graph[v].append(u)
}
for i in graph.indices {
    graph[i].sort(by: >)
}

var visited: [Int] = [Int](repeating: 0, count: n+1)

dfs(graph, v: r, visited: &visited)
for i in 1..<visited.count {
    print(visited[i])
}
