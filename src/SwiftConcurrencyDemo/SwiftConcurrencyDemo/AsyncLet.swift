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
        let result1 = await calculation1()
        let result2 = await calculation2()

        let finalResult = result1 + result2 + 3
        print("Obtained Final Result.")
        return finalResult
    }
    
    static func runTasks() async {
        let result = await fetchResult()
        print(result)
    }
}
