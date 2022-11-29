import Foundation

func getGcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    else { return getGcd(b, a%b) }
}

let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
let gcd: Int = getGcd(input[0], input[1])
let lcm: Int = gcd * (input[0]/gcd) * (input[1]/gcd)
print("\(gcd) \(lcm)")
