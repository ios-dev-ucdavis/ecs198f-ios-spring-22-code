//
//  ReadOnlyAsync.swift
//  SwiftConcurrencyDemo
//
//  Created by Yibo Yan on 5/26/22.
//

import Foundation

class ReadOnlyAsync {
    static func calculation1() async -> Int {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return 1
    }

    static func calculation2() async -> Int {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return 2
    }
    
    static var finalResult: Int {
        get async {
            print("Started async get.")
            async let result1 = calculation1()
            async let result2 = calculation2()
            print("Finished async get.")
            return (await result1) + (await result2) + 3
        }
    }
    
    static func runTasks() async {
        let result = await finalResult
        print(result)
    }
}
