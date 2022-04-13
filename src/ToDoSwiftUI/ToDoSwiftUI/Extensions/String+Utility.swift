//
//  String+Utility.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 4/12/22.
//

import Foundation

extension String: Identifiable {
    public var id: UUID {
        UUID()
    }
}
