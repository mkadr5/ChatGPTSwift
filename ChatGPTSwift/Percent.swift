//
//  Percent.swift
//  ChatGPTSwift
//
//  Created by Muhammet Kadir on 24.05.2023.
//

import SwiftUI

struct Percent {
    fileprivate let value: Int
}

struct ScreenSize {
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height

    static func width(_ percent: Int) -> Percent {
        return Percent(value: Int(screenWidth) * percent / 100)
    }

    static func height(_ percent: Int) -> Percent {
        return Percent(value: Int(screenHeight) * percent / 100)
    }
}

extension Int {
    var w: CGFloat {
        return CGFloat(ScreenSize.width(self).value)
    }

    var h: CGFloat {
        return CGFloat(ScreenSize.height(self).value)
    }
}

