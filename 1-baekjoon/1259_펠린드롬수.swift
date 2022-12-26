import Foundation

var data: String = ""
var result: [String] = []

while true {
    var data: String = readLine()!
    if data=="0" {
        break
    }
    
    if data==String(data.reversed()) {
        result.append("yes")
    } else {
        result.append("no")
    }
}
            
result.forEach { print($0) }
