import UIKit

var greeting = "Hello, playground"

//var body: some View {
//
//}

var name = "Yibo Yan"
var age = 23

var greet: String {
    // String interpolation
    "Hello \(name)"
}

var greetWithAge: String {
    "\(greet), age: \(age)"
}

//greet = "New String"

print(greetWithAge)

