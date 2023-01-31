import Foundation

func permutation(_ targetString: String, targetNum: Int) -> [Int] {
    let target: [String] = Array(targetString).map { String($0) }
    
    var result: [[String]] = []
    var check: [Bool] = [Bool](repeating: false, count: target.count)
    
    func permu(_ arr: [String]) {
        if arr.count == targetNum {
            result.append(arr)
        }
        for i in 0..<target.count {
            if check[i] {
                continue
            } else {
                check[i] = true
                permu(arr + [target[i]])
                check[i] = false
            }
        }
    }
    
    permu([])
    return result.map {
        Int($0.joined())!
    }
}

func isPrime(_ number: Int) -> Bool {
    if number < 4 {
        return number<=1 ? false : true
    }
    
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

func solution(_ numbers:String) -> Int {
    var permu: [Int] = []
    var prime: [Int] = []
    
    for i in 1...numbers.count {
        permu = permutation(numbers, targetNum: i)
        for n in permu {
            if isPrime(n) && !prime.contains(n) {
                prime.append(n)
            }
        }
    }
    
    return prime.count
}

print(solution("011"))
