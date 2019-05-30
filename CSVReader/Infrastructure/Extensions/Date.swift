//
//  Date.swift
//  CSVReader
//
//  Created by Marcos Gonzalez on 2019.
//

import  UIKit

extension Date {

    func toString() -> String? {

        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateStyle = .medium

        return formatter.string(from: self)
    }
}
