import Foundation

var n: String = Array(readLine()!).sorted(by: >).reduce("") {
    (result: String, element: Character) -> String in
    return result + String(element)
}

print(n)
