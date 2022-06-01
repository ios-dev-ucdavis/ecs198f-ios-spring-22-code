//
//  GeometryReaderWithScrollView.swift
//  GestureDemo
//
//  Created by Yibo Yan on 5/31/22.
//

import SwiftUI

class TestData {
    static let testColors: [Color] = [
        .red, .green, .blue,
        .brown, .cyan, .gray,
        .indigo, .mint, .orange,
        .pink, .purple, .teal
    ]
}

struct GeometryReaderWithScrollView: View {
    @Namespace var mainCoordSpace
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(TestData.testColors, id: \.hashValue) { color in
                    GeometryReader { proxy in
                        ZStack {
                            color
                            Text(color.description)
                        }
                        .rotation3DEffect(
                            .degrees(-proxy.frame(in: .named(mainCoordSpace)).minX / 8),
                            axis: (x: 0, y: 1, z: 0)
                        )
                    }
                    .frame(width: 100, height: 200)
                }
                
            }
            .padding(.vertical)
        }
        .coordinateSpace(name: mainCoordSpace)
        .padding(.horizontal)
    }
}

struct GeometryReaderWithScrollView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderWithScrollView()
    }
}
