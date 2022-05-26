//
//  AsyncSequenceDemo.swift
//  SwiftConcurrencyDemo
//
//  Created by Yibo Yan on 5/26/22.
//

import Foundation

class AsyncSequenceDemo {
    static let url = URL(string: "https://dataverse.harvard.edu/api/access/datafile/:persistentId?persistentId=doi:10.7910/DVN/X9MIDJ/1ZQ5CJ")

    static func fetchResult() async {
        guard let url = AsyncSequenceDemo.url else {
            return
        }
        print("Started to fetch data.")
        do {
            for try await line in url.lines {
                let values = line.split(separator: ",")
                print(values[0...5])
            }
        } catch {
            print("Task cancelled.")
        }
    }
    
    static func runTasks() async {
        await fetchResult()
    }
}
