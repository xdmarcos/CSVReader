//
//  Color.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit.UIColor

extension UIColor {

    convenience init(hexString: String) {

        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        let alpha, red, green, blue: UInt32

        Scanner(string: hex).scanHexInt32(&int)

        switch hex.count {

        case 3: // RGB (12-bit)

            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)

            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)

            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:

            (alpha, red, green, blue) = (255, 0, 0, 0)
        }

        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: CGFloat(alpha) / 255)
    }

    static let appDarkGray = UIColor(hexString: "212121")
    static let appWhite = UIColor.white
    static let appBlack = UIColor.black
    static let appLightGray = UIColor.lightText
    static let appGray = UIColor.darkText
    static let appLighterGray = UIColor.lightGray
}
