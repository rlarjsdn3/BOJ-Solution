let input: [Character] = Array(readLine()!)
var countOfAlphabet: [Int] = [Int](repeating: 0, count: 26)

for c: Character in input {
  countOfAlphabet[Int(c.asciiValue!)-97] += 1;
}

countOfAlphabet.forEach { print($0, terminator: " ") }
