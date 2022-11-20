import Foundation

func eratos(_ start: Int, _ end: Int) -> [Int] {
    var check: [Bool] = [Bool](repeating: true, count: end+1)
    let sqrt: Int = Int(sqrt(Double(end)))
    
    check[end] = true
    
    for i in stride(from: 2, through: sqrt, by: 1) {
        if check[i] {
            var j: Int = 2
            while i*j <= end {
                check[i*j] = false
                j += 1
            }
        }
    }
    
    var prime: [Int] = []
    for i in 2...end {
        if check[i] {
            prime.append(i)
        }
    }
    
    return prime.filter { (start <= $0) && ($0 <= end) }
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
eratos(input[0], input[1]).forEach { print($0) }
