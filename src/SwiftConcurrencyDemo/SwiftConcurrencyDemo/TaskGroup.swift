//
//  TaskGroup.swift
//  SwiftConcurrencyDemo
//
//  Created by Yibo Yan on 5/25/22.
//

import Foundation

class TaskGroup {
    static func calculation1() async -> Int {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return 1
    }

    static func calculation2() async -> Int {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return 2
    }

    static func fetchResult(_ id: String) async -> Int {
        print("Started iteration with id = \(id).")
        async let result1 = calculation1()
        async let result2 = calculation2()

        let finalResult = (await result1) + (await result2) + 3
        print("Finished iteration with id = \(id).")
        return finalResult
    }
    
    static func runTasks() async {
        let ids = (1...5).map { String($0) }
        
        var results: [String: Int] = [:]
        
        for id in ids {
            results[id] = await fetchResult(id)
        }
        
        print(results)
    }
}
