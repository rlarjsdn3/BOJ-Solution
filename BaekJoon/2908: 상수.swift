import Foundation

let ab: [String] = readLine()!.components(separatedBy: " ").map {
    (element: String) -> String in
    return element.reversed().reduce("") {
        (result: String, element: Character) -> String in
        return result + String(element);
    }
}

print(ab[0]>ab[1] ? ab[0]:ab[1])
