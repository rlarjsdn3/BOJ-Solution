let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m): (Int, Int) = (input[0], input[1])

var set: Set<String> = Set<String>()
for _ in 0..<n {
    set.insert(readLine()!)
}

var array: [String] = []
for _ in 0..<m {
    array.append(readLine()!)
}

var result: Int = 0
for i in 0..<m {
    if set.contains(array[i]) {
        result += 1
    }
}
print(result)
