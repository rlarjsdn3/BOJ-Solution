import Foundation

func fiboByRR(_ n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    } else {
        return fiboByRR(n-1) + fiboByRR(n-2)
    }
}

func fiboByDP(_ n: Int) -> Int {
    var f: [Int] = [1, 1]
    
    for i in 2..<n {
        f.append(f[i-1] + f[i-2]);
    }
    
    return n - 2
}

let n: Int = Int(readLine()!)!
print("\(fiboByRR(n)) \(fiboByDP(n))")
