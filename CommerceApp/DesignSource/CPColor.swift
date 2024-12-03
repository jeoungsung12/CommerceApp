//
//  CPColor.swift
//  CommerceApp
//
//  Created by 정성윤 on 11/27/24.
//

import Foundation
import UIKit
import SwiftUI

enum CPColor { }

extension CPColor {
    enum UIKit {
        static var bk: UIColor = UIColor(named: "bk")!
        static var wh: UIColor = UIColor(named: "wh")!
        static var coral: UIColor = UIColor(named: "coral")!
        static var yellow: UIColor = UIColor(named: "yellow")!
        static var keyColorRed: UIColor = UIColor(named: "key-color-red")!
        static var keyColorRed2: UIColor = UIColor(named: "key-color-red2")!
        static var keyColorBlue: UIColor = UIColor(named: "key-color-blue")!
        static var keyColorBlueTrans: UIColor = UIColor(named: "key-color-blue-trans")!
        static var gray1: UIColor = UIColor(named: "gray1")!
    }
}

extension CPColor {
    enum SwiftUI {
        static var bk: Color = Color("bk", bundle: nil)
        static var wh: Color = Color("wh", bundle: nil)
        static var coral: Color = Color("coral", bundle: nil)
        static var yellow: Color = Color("yellow", bundle: nil)
        static var keyColorRed: Color = Color("keyColorRed", bundle: nil)
        static var keyColorRed2: Color = Color("keyColorRed2", bundle: nil)
        static var keyColorBlue: Color = Color("keyColorBlue", bundle: nil)
        static var keyColorBlueTrans: Color = Color("keyColorBlueTrans", bundle: nil)
        static var gray1: Color = Color("gray1", bundle: nil)
    }
}
