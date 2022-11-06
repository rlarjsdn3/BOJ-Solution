let n: Int = Int(readLine()!)!
var member: [(age: Int, name: String, seq: Int)] = []
for i in 0..<n {
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
    member.append((Int(input[0])!, input[1], i))
}
member.sort {
    if $0.age == $1.age {
        return $0.seq < $1.seq
    }
    
    return $0.age < $1.age
}

member.forEach {
    print("\($0.age) \($0.name)")
}
