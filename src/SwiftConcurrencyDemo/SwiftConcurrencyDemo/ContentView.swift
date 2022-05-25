//
//  ContentView.swift
//  SwiftConcurrencyDemo
//
//  Created by Yibo Yan on 5/24/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .task {
                await AsyncLet.runTasks()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
