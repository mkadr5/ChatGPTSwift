//
//  extensions.swift
//  ChatGPTSwift
//
//  Created by Muhammet Kadir on 24.05.2023.
//

import Foundation

extension Array {
    mutating func addAll(_ elements: [Element]) {
        self.append(contentsOf: elements)
    }
}
