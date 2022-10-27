import Foundation

let n: Int = Int(readLine()!)!

var count: Int = 0
var isGroupWord: Bool = true
var visited: [Bool] = []
for _ in stride(from: 0, to: n, by: 1) {
    let word: String = readLine()!
    
    isGroupWord = true
    visited = [Bool](repeating: false, count: 27)
    
    visited[Int(word[word.startIndex].asciiValue!)-97+1] = true
    for i in 1..<word.count {
        let currChar = word[word.index(word.startIndex, offsetBy: i)]
        let prevChar = word[word.index(word.startIndex, offsetBy: i-1)]
        let IdxCurrChar = Int(currChar.asciiValue!)-97+1
        
        if prevChar != currChar  && visited[IdxCurrChar] {
            isGroupWord = false
            continue
        }
        
        if visited[IdxCurrChar] != true {
            visited[IdxCurrChar] = true
        }
    }
    
    if isGroupWord {
        count += 1
    }
}

print(count)
