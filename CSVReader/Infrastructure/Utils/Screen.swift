//
//  Screen.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import UIKit.UIScreen

internal struct ScreenSize {

    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
}

internal struct DeviceScreenType {

    static let iPhone4OrLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength < 568.0
    static let iPhone5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 568.0
    static let iPhone6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
    static let iPhone6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
    static let iPhoneNotch = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength >= 812.0
    static let iPhoneSmallScreen = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength <= 568.0
    static let iPhoneBigScreen = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength > 568.0
}
