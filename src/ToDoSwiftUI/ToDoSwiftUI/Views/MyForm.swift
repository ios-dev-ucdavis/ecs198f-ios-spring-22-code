//
//  MyForm.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 5/5/22.
//

import SwiftUI

struct MyForm: View {
    var body: some View {
        Form {
            Section("This is a demo section") {
                Text("Hello")
            }
            
            Section {
                Text("Hello, there")
            } header: {
                Label("Demo Section with Icon", systemImage: "megaphone.fill")
                    .foregroundColor(.red)
            }

        }
    }
}

struct MyForm_Previews: PreviewProvider {
    static var previews: some View {
        MyForm()
    }
}
