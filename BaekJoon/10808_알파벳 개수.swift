let input: [Character] = Array(readLine()!)
var count: [Int] = [Int](repeating: 0, count: 26)

for c in input {
  count[Int(c.asciiValue!)-97] += 1;
}
count.forEach { print($0, terminator: " ") }
