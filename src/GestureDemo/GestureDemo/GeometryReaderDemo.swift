//
//  GeometryReaderDemo.swift
//  GestureDemo
//
//  Created by Yibo Yan on 5/31/22.
//

import SwiftUI

struct InnerView: View {
    var body: some View {
        GeometryReader { proxy in
            Color.red
                .frame(
                    width: proxy.size.width / 2,
                    height: proxy.size.width / 2
                )
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
        }
    }
}

struct GeometryReaderDemo: View {
    var body: some View {
        InnerView()
            .frame(width: 100, height: 100)
            .border(.green, width: 2)
    }
}

struct GeometryReaderDemo_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderDemo()
    }
}
