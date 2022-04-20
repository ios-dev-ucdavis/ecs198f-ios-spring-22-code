//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 3/29/22.
//

import SwiftUI

struct ContentView: View {
    var myStr = "Hello, Yibo"
    
    let reminderGroupNames: [String] = {
        var names = [String]()
        // [String] == Array<String>
        for i in 0...10 {
            names.append("Group " + String(i))
        }
        return names
    }()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(reminderGroupNames, id: \.hashValue) { name in
                    NavigationLink {
                        Text("Hello")
                            .navigationTitle(name)
                    } label: {
                        GroupCardView(name: name)
                            .frame(height: 150)
                            .padding(.horizontal)
                    }
                    .buttonStyle(.plain)
                }
            }
            .background(Color.gray)
//            .navigationBarHidden(true)
            .navigationTitle("Welcome")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("Hello")
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Hello")
                    } label: {
                        Image(systemName: "trash.square")
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
