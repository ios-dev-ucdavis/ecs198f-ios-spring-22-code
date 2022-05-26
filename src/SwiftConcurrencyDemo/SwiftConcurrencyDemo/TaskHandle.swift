//
//  TaskHandle.swift
//  SwiftConcurrencyDemo
//
//  Created by Yibo Yan on 5/26/22.
//

import Foundation

class TaskHandle {
    static func runTasks() async {
        print("Started Task.")
        if Task.isCancelled {
            print("Task is cancelled.")
            return
        }
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        if Task.isCancelled {
            print("Task is cancelled.")
            return
        }
        print("Finished Task.")
    }
}
