//: [Previous](@previous)

import Foundation

var value = 0

func add(_ number: Int, _ op: (Int) -> Void) {
    op(number)
}

add(10) { number in
    value += number
}

print(value)

//: [Next](@next)
