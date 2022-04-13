//
//  hw1hints.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 4/12/22.
//

import SwiftUI

struct hw1hints: View {
    @State var showFillCapsule = false
        
    var body: some View {
        VStack {
            Image(systemName: "capsule.fill")
            Image(systemName: "capsule")
                .resizable()
                .frame(width: 100, height: 100)
            
            Button("Hello") {
                print("Hello")
            }
            
            Button {
                print("Hello")
            } label: {
                Text("Hello")
                Image(systemName: "capsule.fill")
            }

        }
    }
}

struct hw1hints_Previews: PreviewProvider {
    static var previews: some View {
        hw1hints()
    }
}
