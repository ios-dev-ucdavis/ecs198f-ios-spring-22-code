//
//  MyTextField.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 5/5/22.
//

import SwiftUI

struct MyTextField: View {
    @State var myStr = ""
    
    var body: some View {
        VStack {
            TextField("My TextField", text: $myStr)
            Text(myStr)
        }
        
    }
}

struct MyTextField_Previews: PreviewProvider {
    static var previews: some View {
        MyTextField()
    }
}
