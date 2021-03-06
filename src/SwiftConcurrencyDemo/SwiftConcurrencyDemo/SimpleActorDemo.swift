//
//  SimpleActorDemo.swift
//  SwiftConcurrencyDemo
//
//  Created by Yibo Yan on 5/26/22.
//

import Foundation

actor Counter {
    let id = UUID()
    var value = 0
    
    @discardableResult
    func increment() -> Int {
        value += 1
        return value
    }
}

class SimpleActorDemo {
    static func runTasks() async {
        let counter = Counter()

        await withTaskGroup(of: Void.self) { group in
            for _ in 1...1000 {
                group.addTask {
                    print(await counter.increment())
                }
            }
        }

        print("Final value = \(await counter.value)")
    }
}

extension Counter: Equatable {
    static func == (lhs: Counter, rhs: Counter) -> Bool {
        lhs.id == rhs.id
    }
}

extension Counter: Hashable {
    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Counter {
    func incrementTo(_ targetValue: Int) {
        for _ in self.value..<targetValue {
            increment()
        }
        assert(targetValue == self.value)
    }

    nonisolated func dummyPrint() {
        print("Hello, world.")
    }
}
