//
//  ContentView.swift
//  SwiftConcurrencyDemo
//
//  Created by Yibo Yan on 5/24/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            asyncLetButton
            readOnlyAsync
            taskGroupButton
            taskHandle
            asyncSequenceDemo
            simpleActorDemo
        }
        .padding()
    }
    
    var asyncLetButton: some View {
        Button("Run AsyncLet Task") {
            Task {
                await AsyncLet.runTasks()
            }
        }
    }
    
    var readOnlyAsync: some View {
        Button("Run Read Only Async") {
            Task {
                await ReadOnlyAsync.runTasks()
            }
        }
    }
    
    var taskGroupButton: some View {
        Button("Run TaskGroup Task") {
            Task {
                await TaskGroup.runTasks()
            }
        }
    }
    
    var taskHandle: some View {
        Button("Run Task Handle") {
            let handle = Task {
                await TaskHandle.runTasks()
            }
            handle.cancel()
        }
    }
    
    var asyncSequenceDemo: some View {
        HStack {
            var handle: Task<(), Never>? = nil
            Button("Run Async Sequence Demo") {
                handle = Task {
                    await AsyncSequenceDemo.runTasks()
                }
            }
            
            Button("Cancel Async Sequence Demo") {
                handle?.cancel()
            }
        }
    }
    
    @ViewBuilder var simpleActorDemo: some View {
        Button("Run Simple Actor Demo") {
            Task {
                await SimpleActorDemo.runTasks()
            }
        }
        
        Button("Run Simple Actor Demo with incrementTo") {
            Task {
                let counter = Counter()
                await counter.incrementTo(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
