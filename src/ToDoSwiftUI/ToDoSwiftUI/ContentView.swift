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
        ScrollView {
            ForEach(reminderGroupNames, id: \.hashValue) { name in
                GroupCardView(name: name)
                    .frame(height: 150)
                    .padding(.horizontal)
            }
        }
        .background(Color.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
