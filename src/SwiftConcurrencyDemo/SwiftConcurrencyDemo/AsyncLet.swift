//
//  AsyncLet.swift
//  SwiftConcurrencyDemo
//
//  Created by Yibo Yan on 5/24/22.
//

import Foundation

class AsyncLet {
    static func calculation1() async -> Int {
        // Mimic heavy task - 2 seconds.
        print("Started task 1.")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        print("Finished task 1.")
        return 1
    }

    static func calculation2() async -> Int {
        // Mimic heavy task - 2 seconds.
        print("Started task 2.")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        print("Finished task 2.")
        return 2
    }

    static func fetchResult() async -> Int {
        defer {
            print("Obtained Final Result.")
        }
        
        async let result1 = calculation1()
        async let result2 = calculation2()

        let finalResult = await [result1, result2, 3].reduce(0, +)
//        let finalResult = (await result1) + (await result2) + 3
        
        return finalResult
    }
    
    static func runTasks() async {
        let result = await fetchResult()
        print(result)
    }
}
