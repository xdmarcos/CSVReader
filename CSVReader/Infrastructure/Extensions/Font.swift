//
//  Font.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit.UIFont

extension UIFont {

    open class func appFont(ofSize fontSize: CGFloat) -> UIFont {
        if let futuraFont = UIFont(name: "SFProText-Regular", size: fontSize) {
            return scaled(font: futuraFont)
        } else {
            return scaled(font: UIFont.boldSystemFont(ofSize: fontSize))
        }
    }

    open class func appBoldFont(ofSize fontSize: CGFloat) -> UIFont {
        if let futuraFont = UIFont(name: "SFProText-Bold", size: fontSize) {
            return scaled(font: futuraFont)
        } else {
            return scaled(font: UIFont.boldSystemFont(ofSize: fontSize))
        }
    }

    open class func largeTitlesFont(ofSize fontSize: CGFloat = 24.0) -> UIFont {
        if let futuraFont = UIFont(name: "SFProText-Bold", size: fontSize) {
            return scaled(font: futuraFont)
        } else {
            return scaled(font: UIFont.boldSystemFont(ofSize: fontSize))
        }
    }

    private class func scaled(font: UIFont) -> UIFont {

        let scaledFont = UIFontMetrics.default.scaledFont(for: font)
        return scaledFont
    }
}
