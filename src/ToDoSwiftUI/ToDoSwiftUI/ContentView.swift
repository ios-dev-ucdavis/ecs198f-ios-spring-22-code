//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 3/29/22.
//

import SwiftUI

struct ContentView: View {
    var myStr = "Hello, Yibo"
    
    var body: some View {
        return Text(myStr)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}