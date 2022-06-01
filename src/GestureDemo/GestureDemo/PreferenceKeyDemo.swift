//
//  PreferenceKeyDemo.swift
//  GestureDemo
//
//  Created by Yibo Yan on 5/31/22.
//

import SwiftUI

struct TitleKey: PreferenceKey {
    static var defaultValue = ""

    static func reduce(value: inout String, nextValue: () -> String) {
        value += " " + nextValue()
    }
}

extension View {
    func mainViewTitle(_ value: String) -> some View {
        self.preference(key: TitleKey.self, value: value)
    }
}

struct NestedView: View {
    var body: some View {
        VStack {
            Text("This is NestedView")
                .mainViewTitle("From NestedView.")
        }
        .padding()
        .background(.green)
    }
}

struct ChildView: View {
    var body: some View {
        VStack {
            Text("This is ChildView")
//                .preference(key: TitleKey.self, value: "From ChildView.")
                .mainViewTitle("From ChildView.")
            NestedView()
        }
        .padding()
        .background(.red)
    }
}

struct PreferenceKeyDemo: View {
    @State var title = "Hello, world"
    
    var body: some View {
        VStack {
            Text(title)
            Text("This is MainView")
            ChildView()
        }
        .padding()
        .background(.blue)
        .onPreferenceChange(TitleKey.self) { value in
            title = value
        }
    }
}

struct PreferenceKeyDemo_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyDemo()
    }
}
